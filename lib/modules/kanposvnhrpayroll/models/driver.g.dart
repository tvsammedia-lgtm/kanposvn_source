// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDriverCollection on Isar {
  IsarCollection<Driver> get drivers => this.collection();
}

const DriverSchema = CollectionSchema(
  name: r'Driver',
  id: 7545170947392015832,
  properties: {
    r'allowanceFuel': PropertySchema(
      id: 0,
      name: r'allowanceFuel',
      type: IsarType.double,
    ),
    r'allowanceMeal': PropertySchema(
      id: 1,
      name: r'allowanceMeal',
      type: IsarType.double,
    ),
    r'allowanceNightStay': PropertySchema(
      id: 2,
      name: r'allowanceNightStay',
      type: IsarType.double,
    ),
    r'allowancePhone': PropertySchema(
      id: 3,
      name: r'allowancePhone',
      type: IsarType.double,
    ),
    r'baseSalary': PropertySchema(
      id: 4,
      name: r'baseSalary',
      type: IsarType.double,
    ),
    r'canDriveContainer': PropertySchema(
      id: 5,
      name: r'canDriveContainer',
      type: IsarType.bool,
    ),
    r'canDriveMooc': PropertySchema(
      id: 6,
      name: r'canDriveMooc',
      type: IsarType.bool,
    ),
    r'canDriveTractor': PropertySchema(
      id: 7,
      name: r'canDriveTractor',
      type: IsarType.bool,
    ),
    r'canDriveTruck': PropertySchema(
      id: 8,
      name: r'canDriveTruck',
      type: IsarType.bool,
    ),
    r'createdAt': PropertySchema(
      id: 9,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'employeeCode': PropertySchema(
      id: 10,
      name: r'employeeCode',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 11,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'experienceYears': PropertySchema(
      id: 12,
      name: r'experienceYears',
      type: IsarType.long,
    ),
    r'fullName': PropertySchema(
      id: 13,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'hasAdrCertificate': PropertySchema(
      id: 14,
      name: r'hasAdrCertificate',
      type: IsarType.bool,
    ),
    r'hasDangerousGoodsCert': PropertySchema(
      id: 15,
      name: r'hasDangerousGoodsCert',
      type: IsarType.bool,
    ),
    r'healthCheckDate': PropertySchema(
      id: 16,
      name: r'healthCheckDate',
      type: IsarType.dateTime,
    ),
    r'healthCheckExpiry': PropertySchema(
      id: 17,
      name: r'healthCheckExpiry',
      type: IsarType.dateTime,
    ),
    r'lastSyncAt': PropertySchema(
      id: 18,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'licenseClass': PropertySchema(
      id: 19,
      name: r'licenseClass',
      type: IsarType.string,
      enumMap: _DriverlicenseClassEnumValueMap,
    ),
    r'licenseExpiryDate': PropertySchema(
      id: 20,
      name: r'licenseExpiryDate',
      type: IsarType.dateTime,
    ),
    r'licenseIssueDate': PropertySchema(
      id: 21,
      name: r'licenseIssueDate',
      type: IsarType.dateTime,
    ),
    r'licenseNumber': PropertySchema(
      id: 22,
      name: r'licenseNumber',
      type: IsarType.string,
    ),
    r'needsSync': PropertySchema(
      id: 23,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'remoteId': PropertySchema(
      id: 24,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'revenueSharePercent': PropertySchema(
      id: 25,
      name: r'revenueSharePercent',
      type: IsarType.double,
    ),
    r'salaryPerContainer': PropertySchema(
      id: 26,
      name: r'salaryPerContainer',
      type: IsarType.double,
    ),
    r'salaryPerKm': PropertySchema(
      id: 27,
      name: r'salaryPerKm',
      type: IsarType.double,
    ),
    r'salaryPerTrip': PropertySchema(
      id: 28,
      name: r'salaryPerTrip',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 29,
      name: r'status',
      type: IsarType.string,
      enumMap: _DriverstatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 30,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _driverEstimateSize,
  serialize: _driverSerialize,
  deserialize: _driverDeserialize,
  deserializeProp: _driverDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _driverGetId,
  getLinks: _driverGetLinks,
  attach: _driverAttach,
  version: '3.1.0+1',
);

int _driverEstimateSize(
  Driver object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.employeeCode.length * 3;
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.licenseClass.name.length * 3;
  {
    final value = object.licenseNumber;
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
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _driverSerialize(
  Driver object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.allowanceFuel);
  writer.writeDouble(offsets[1], object.allowanceMeal);
  writer.writeDouble(offsets[2], object.allowanceNightStay);
  writer.writeDouble(offsets[3], object.allowancePhone);
  writer.writeDouble(offsets[4], object.baseSalary);
  writer.writeBool(offsets[5], object.canDriveContainer);
  writer.writeBool(offsets[6], object.canDriveMooc);
  writer.writeBool(offsets[7], object.canDriveTractor);
  writer.writeBool(offsets[8], object.canDriveTruck);
  writer.writeDateTime(offsets[9], object.createdAt);
  writer.writeString(offsets[10], object.employeeCode);
  writer.writeLong(offsets[11], object.employeeId);
  writer.writeLong(offsets[12], object.experienceYears);
  writer.writeString(offsets[13], object.fullName);
  writer.writeBool(offsets[14], object.hasAdrCertificate);
  writer.writeBool(offsets[15], object.hasDangerousGoodsCert);
  writer.writeDateTime(offsets[16], object.healthCheckDate);
  writer.writeDateTime(offsets[17], object.healthCheckExpiry);
  writer.writeDateTime(offsets[18], object.lastSyncAt);
  writer.writeString(offsets[19], object.licenseClass.name);
  writer.writeDateTime(offsets[20], object.licenseExpiryDate);
  writer.writeDateTime(offsets[21], object.licenseIssueDate);
  writer.writeString(offsets[22], object.licenseNumber);
  writer.writeBool(offsets[23], object.needsSync);
  writer.writeString(offsets[24], object.remoteId);
  writer.writeDouble(offsets[25], object.revenueSharePercent);
  writer.writeDouble(offsets[26], object.salaryPerContainer);
  writer.writeDouble(offsets[27], object.salaryPerKm);
  writer.writeDouble(offsets[28], object.salaryPerTrip);
  writer.writeString(offsets[29], object.status.name);
  writer.writeDateTime(offsets[30], object.updatedAt);
}

Driver _driverDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Driver();
  object.allowanceFuel = reader.readDouble(offsets[0]);
  object.allowanceMeal = reader.readDouble(offsets[1]);
  object.allowanceNightStay = reader.readDouble(offsets[2]);
  object.allowancePhone = reader.readDouble(offsets[3]);
  object.baseSalary = reader.readDouble(offsets[4]);
  object.canDriveContainer = reader.readBool(offsets[5]);
  object.canDriveMooc = reader.readBool(offsets[6]);
  object.canDriveTractor = reader.readBool(offsets[7]);
  object.canDriveTruck = reader.readBool(offsets[8]);
  object.createdAt = reader.readDateTime(offsets[9]);
  object.employeeCode = reader.readString(offsets[10]);
  object.employeeId = reader.readLong(offsets[11]);
  object.experienceYears = reader.readLong(offsets[12]);
  object.fullName = reader.readString(offsets[13]);
  object.hasAdrCertificate = reader.readBool(offsets[14]);
  object.hasDangerousGoodsCert = reader.readBool(offsets[15]);
  object.healthCheckDate = reader.readDateTimeOrNull(offsets[16]);
  object.healthCheckExpiry = reader.readDateTimeOrNull(offsets[17]);
  object.id = id;
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[18]);
  object.licenseClass =
      _DriverlicenseClassValueEnumMap[reader.readStringOrNull(offsets[19])] ??
          DriverLicenseClass.b1;
  object.licenseExpiryDate = reader.readDateTimeOrNull(offsets[20]);
  object.licenseIssueDate = reader.readDateTimeOrNull(offsets[21]);
  object.licenseNumber = reader.readStringOrNull(offsets[22]);
  object.needsSync = reader.readBool(offsets[23]);
  object.remoteId = reader.readStringOrNull(offsets[24]);
  object.revenueSharePercent = reader.readDouble(offsets[25]);
  object.salaryPerContainer = reader.readDouble(offsets[26]);
  object.salaryPerKm = reader.readDouble(offsets[27]);
  object.salaryPerTrip = reader.readDouble(offsets[28]);
  object.status =
      _DriverstatusValueEnumMap[reader.readStringOrNull(offsets[29])] ??
          DriverStatus.driving;
  object.updatedAt = reader.readDateTime(offsets[30]);
  return object;
}

P _driverDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (_DriverlicenseClassValueEnumMap[
              reader.readStringOrNull(offset)] ??
          DriverLicenseClass.b1) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 21:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readBool(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readDouble(offset)) as P;
    case 29:
      return (_DriverstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          DriverStatus.driving) as P;
    case 30:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DriverlicenseClassEnumValueMap = {
  r'b1': r'b1',
  r'b2': r'b2',
  r'c': r'c',
  r'd': r'd',
  r'e': r'e',
  r'f': r'f',
};
const _DriverlicenseClassValueEnumMap = {
  r'b1': DriverLicenseClass.b1,
  r'b2': DriverLicenseClass.b2,
  r'c': DriverLicenseClass.c,
  r'd': DriverLicenseClass.d,
  r'e': DriverLicenseClass.e,
  r'f': DriverLicenseClass.f,
};
const _DriverstatusEnumValueMap = {
  r'driving': r'driving',
  r'onLeave': r'onLeave',
  r'resigned': r'resigned',
  r'suspended': r'suspended',
};
const _DriverstatusValueEnumMap = {
  r'driving': DriverStatus.driving,
  r'onLeave': DriverStatus.onLeave,
  r'resigned': DriverStatus.resigned,
  r'suspended': DriverStatus.suspended,
};

Id _driverGetId(Driver object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _driverGetLinks(Driver object) {
  return [];
}

void _driverAttach(IsarCollection<dynamic> col, Id id, Driver object) {
  object.id = id;
}

extension DriverQueryWhereSort on QueryBuilder<Driver, Driver, QWhere> {
  QueryBuilder<Driver, Driver, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DriverQueryWhere on QueryBuilder<Driver, Driver, QWhereClause> {
  QueryBuilder<Driver, Driver, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Driver, Driver, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Driver, Driver, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Driver, Driver, QAfterWhereClause> idBetween(
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

extension DriverQueryFilter on QueryBuilder<Driver, Driver, QFilterCondition> {
  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceFuelEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowanceFuel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceFuelGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowanceFuel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceFuelLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowanceFuel',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceFuelBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowanceFuel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceMealEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowanceMeal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceMealGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowanceMeal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceMealLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowanceMeal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceMealBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowanceMeal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceNightStayEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowanceNightStay',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      allowanceNightStayGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowanceNightStay',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      allowanceNightStayLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowanceNightStay',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowanceNightStayBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowanceNightStay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowancePhoneEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowancePhone',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowancePhoneGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowancePhone',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowancePhoneLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowancePhone',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> allowancePhoneBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowancePhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> baseSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> baseSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> baseSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> baseSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> canDriveContainerEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canDriveContainer',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> canDriveMoocEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canDriveMooc',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> canDriveTractorEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canDriveTractor',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> canDriveTruckEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canDriveTruck',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeEqualTo(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeBetween(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeStartsWith(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeEndsWith(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeIdGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeIdLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> employeeIdBetween(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> experienceYearsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      experienceYearsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> experienceYearsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'experienceYears',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> experienceYearsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'experienceYears',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> hasAdrCertificateEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasAdrCertificate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      hasDangerousGoodsCertEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasDangerousGoodsCert',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'healthCheckDate',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      healthCheckDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'healthCheckDate',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthCheckDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      healthCheckDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healthCheckDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healthCheckDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healthCheckDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      healthCheckExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'healthCheckExpiry',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      healthCheckExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'healthCheckExpiry',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckExpiryEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthCheckExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      healthCheckExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healthCheckExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healthCheckExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> healthCheckExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healthCheckExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassEqualTo(
    DriverLicenseClass value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassGreaterThan(
    DriverLicenseClass value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassLessThan(
    DriverLicenseClass value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassBetween(
    DriverLicenseClass lower,
    DriverLicenseClass upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licenseClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licenseClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licenseClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licenseClass',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseClass',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseClassIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licenseClass',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      licenseExpiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licenseExpiryDate',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      licenseExpiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licenseExpiryDate',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseExpiryDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseExpiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      licenseExpiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseExpiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseExpiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseExpiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseExpiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseExpiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseIssueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licenseIssueDate',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      licenseIssueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licenseIssueDate',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseIssueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      licenseIssueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseIssueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseIssueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseIssueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licenseNumber',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licenseNumber',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licenseNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> licenseNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      licenseNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licenseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdContains(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      revenueSharePercentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueSharePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      revenueSharePercentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueSharePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      revenueSharePercentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueSharePercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      revenueSharePercentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueSharePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerContainerEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salaryPerContainer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      salaryPerContainerGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salaryPerContainer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition>
      salaryPerContainerLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salaryPerContainer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerContainerBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salaryPerContainer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salaryPerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salaryPerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salaryPerKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salaryPerKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerTripEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salaryPerTrip',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerTripGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salaryPerTrip',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerTripLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salaryPerTrip',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> salaryPerTripBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salaryPerTrip',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusEqualTo(
    DriverStatus value, {
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusGreaterThan(
    DriverStatus value, {
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusLessThan(
    DriverStatus value, {
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusBetween(
    DriverStatus lower,
    DriverStatus upper, {
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Driver, Driver, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Driver, Driver, QAfterFilterCondition> updatedAtBetween(
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
}

extension DriverQueryObject on QueryBuilder<Driver, Driver, QFilterCondition> {}

extension DriverQueryLinks on QueryBuilder<Driver, Driver, QFilterCondition> {}

extension DriverQuerySortBy on QueryBuilder<Driver, Driver, QSortBy> {
  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowanceFuelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowanceNightStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveContainer', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveContainer', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveMooc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveMooc', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveMoocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveMooc', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveTractor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTractor', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveTractorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTractor', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveTruck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTruck', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCanDriveTruckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTruck', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByExperienceYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHasAdrCertificate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAdrCertificate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHasAdrCertificateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAdrCertificate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHasDangerousGoodsCert() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDangerousGoodsCert', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHasDangerousGoodsCertDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDangerousGoodsCert', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHealthCheckDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckDate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHealthCheckDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckDate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHealthCheckExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckExpiry', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByHealthCheckExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckExpiry', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseClass', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseClass', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiryDate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiryDate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseIssueDate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseIssueDate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByLicenseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByRevenueSharePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSharePercent', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByRevenueSharePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSharePercent', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortBySalaryPerContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerContainer', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortBySalaryPerContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerContainer', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortBySalaryPerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerKm', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortBySalaryPerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerKm', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortBySalaryPerTrip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerTrip', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortBySalaryPerTripDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerTrip', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DriverQuerySortThenBy on QueryBuilder<Driver, Driver, QSortThenBy> {
  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowanceFuelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowanceNightStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveContainer', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveContainer', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveMooc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveMooc', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveMoocDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveMooc', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveTractor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTractor', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveTractorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTractor', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveTruck() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTruck', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCanDriveTruckDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canDriveTruck', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByExperienceYearsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experienceYears', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHasAdrCertificate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAdrCertificate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHasAdrCertificateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasAdrCertificate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHasDangerousGoodsCert() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDangerousGoodsCert', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHasDangerousGoodsCertDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasDangerousGoodsCert', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHealthCheckDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckDate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHealthCheckDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckDate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHealthCheckExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckExpiry', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByHealthCheckExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthCheckExpiry', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseClass', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseClass', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiryDate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiryDate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseIssueDate', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseIssueDate', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByLicenseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByRevenueSharePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSharePercent', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByRevenueSharePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSharePercent', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenBySalaryPerContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerContainer', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenBySalaryPerContainerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerContainer', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenBySalaryPerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerKm', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenBySalaryPerKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerKm', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenBySalaryPerTrip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerTrip', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenBySalaryPerTripDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salaryPerTrip', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Driver, Driver, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DriverQueryWhereDistinct on QueryBuilder<Driver, Driver, QDistinct> {
  QueryBuilder<Driver, Driver, QDistinct> distinctByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceFuel');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceMeal');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceNightStay');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowancePhone');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseSalary');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByCanDriveContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canDriveContainer');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByCanDriveMooc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canDriveMooc');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByCanDriveTractor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canDriveTractor');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByCanDriveTruck() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canDriveTruck');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByEmployeeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByExperienceYears() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'experienceYears');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByHasAdrCertificate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasAdrCertificate');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByHasDangerousGoodsCert() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasDangerousGoodsCert');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByHealthCheckDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthCheckDate');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByHealthCheckExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthCheckExpiry');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByLicenseClass(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseClass', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByLicenseExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseExpiryDate');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByLicenseIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseIssueDate');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByLicenseNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByRevenueSharePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueSharePercent');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctBySalaryPerContainer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salaryPerContainer');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctBySalaryPerKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salaryPerKm');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctBySalaryPerTrip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salaryPerTrip');
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Driver, Driver, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension DriverQueryProperty on QueryBuilder<Driver, Driver, QQueryProperty> {
  QueryBuilder<Driver, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> allowanceFuelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceFuel');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> allowanceMealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceMeal');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> allowanceNightStayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceNightStay');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> allowancePhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowancePhone');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> baseSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseSalary');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> canDriveContainerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canDriveContainer');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> canDriveMoocProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canDriveMooc');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> canDriveTractorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canDriveTractor');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> canDriveTruckProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canDriveTruck');
    });
  }

  QueryBuilder<Driver, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Driver, String, QQueryOperations> employeeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCode');
    });
  }

  QueryBuilder<Driver, int, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<Driver, int, QQueryOperations> experienceYearsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'experienceYears');
    });
  }

  QueryBuilder<Driver, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> hasAdrCertificateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasAdrCertificate');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> hasDangerousGoodsCertProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasDangerousGoodsCert');
    });
  }

  QueryBuilder<Driver, DateTime?, QQueryOperations> healthCheckDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthCheckDate');
    });
  }

  QueryBuilder<Driver, DateTime?, QQueryOperations>
      healthCheckExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthCheckExpiry');
    });
  }

  QueryBuilder<Driver, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Driver, DriverLicenseClass, QQueryOperations>
      licenseClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseClass');
    });
  }

  QueryBuilder<Driver, DateTime?, QQueryOperations>
      licenseExpiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseExpiryDate');
    });
  }

  QueryBuilder<Driver, DateTime?, QQueryOperations> licenseIssueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseIssueDate');
    });
  }

  QueryBuilder<Driver, String?, QQueryOperations> licenseNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseNumber');
    });
  }

  QueryBuilder<Driver, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Driver, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> revenueSharePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueSharePercent');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> salaryPerContainerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salaryPerContainer');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> salaryPerKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salaryPerKm');
    });
  }

  QueryBuilder<Driver, double, QQueryOperations> salaryPerTripProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salaryPerTrip');
    });
  }

  QueryBuilder<Driver, DriverStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Driver, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
