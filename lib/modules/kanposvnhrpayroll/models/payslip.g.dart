// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payslip.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPayslipCollection on Isar {
  IsarCollection<Payslip> get payslips => this.collection();
}

const PayslipSchema = CollectionSchema(
  name: r'Payslip',
  id: 2501126664344369121,
  properties: {
    r'actualWorkingDays': PropertySchema(
      id: 0,
      name: r'actualWorkingDays',
      type: IsarType.double,
    ),
    r'advanceDeduction': PropertySchema(
      id: 1,
      name: r'advanceDeduction',
      type: IsarType.double,
    ),
    r'allowanceFuel': PropertySchema(
      id: 2,
      name: r'allowanceFuel',
      type: IsarType.double,
    ),
    r'allowanceMeal': PropertySchema(
      id: 3,
      name: r'allowanceMeal',
      type: IsarType.double,
    ),
    r'allowanceNightStay': PropertySchema(
      id: 4,
      name: r'allowanceNightStay',
      type: IsarType.double,
    ),
    r'allowancePhone': PropertySchema(
      id: 5,
      name: r'allowancePhone',
      type: IsarType.double,
    ),
    r'baseSalary': PropertySchema(
      id: 6,
      name: r'baseSalary',
      type: IsarType.double,
    ),
    r'bhtnEmployee': PropertySchema(
      id: 7,
      name: r'bhtnEmployee',
      type: IsarType.double,
    ),
    r'bhtnEmployer': PropertySchema(
      id: 8,
      name: r'bhtnEmployer',
      type: IsarType.double,
    ),
    r'bhxhEmployee': PropertySchema(
      id: 9,
      name: r'bhxhEmployee',
      type: IsarType.double,
    ),
    r'bhxhEmployer': PropertySchema(
      id: 10,
      name: r'bhxhEmployer',
      type: IsarType.double,
    ),
    r'bhytEmployee': PropertySchema(
      id: 11,
      name: r'bhytEmployee',
      type: IsarType.double,
    ),
    r'bhytEmployer': PropertySchema(
      id: 12,
      name: r'bhytEmployer',
      type: IsarType.double,
    ),
    r'containerSalary': PropertySchema(
      id: 13,
      name: r'containerSalary',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 14,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'department': PropertySchema(
      id: 15,
      name: r'department',
      type: IsarType.string,
    ),
    r'diligenceBonus': PropertySchema(
      id: 16,
      name: r'diligenceBonus',
      type: IsarType.double,
    ),
    r'earnedBaseSalary': PropertySchema(
      id: 17,
      name: r'earnedBaseSalary',
      type: IsarType.double,
    ),
    r'employeeCode': PropertySchema(
      id: 18,
      name: r'employeeCode',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 19,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'employeeName': PropertySchema(
      id: 20,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'fuelSavingBonus': PropertySchema(
      id: 21,
      name: r'fuelSavingBonus',
      type: IsarType.double,
    ),
    r'generatedAt': PropertySchema(
      id: 22,
      name: r'generatedAt',
      type: IsarType.dateTime,
    ),
    r'grossSalary': PropertySchema(
      id: 23,
      name: r'grossSalary',
      type: IsarType.double,
    ),
    r'kmSalary': PropertySchema(
      id: 24,
      name: r'kmSalary',
      type: IsarType.double,
    ),
    r'kpiBonus': PropertySchema(
      id: 25,
      name: r'kpiBonus',
      type: IsarType.double,
    ),
    r'lastSyncAt': PropertySchema(
      id: 26,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'month': PropertySchema(
      id: 27,
      name: r'month',
      type: IsarType.long,
    ),
    r'monthlyBonus': PropertySchema(
      id: 28,
      name: r'monthlyBonus',
      type: IsarType.double,
    ),
    r'needsSync': PropertySchema(
      id: 29,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'netSalary': PropertySchema(
      id: 30,
      name: r'netSalary',
      type: IsarType.double,
    ),
    r'notes': PropertySchema(
      id: 31,
      name: r'notes',
      type: IsarType.string,
    ),
    r'otherBonus': PropertySchema(
      id: 32,
      name: r'otherBonus',
      type: IsarType.double,
    ),
    r'otherDeduction': PropertySchema(
      id: 33,
      name: r'otherDeduction',
      type: IsarType.double,
    ),
    r'overtimeSalary': PropertySchema(
      id: 34,
      name: r'overtimeSalary',
      type: IsarType.double,
    ),
    r'personalIncomeTax': PropertySchema(
      id: 35,
      name: r'personalIncomeTax',
      type: IsarType.double,
    ),
    r'position': PropertySchema(
      id: 36,
      name: r'position',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 37,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'revenueSalary': PropertySchema(
      id: 38,
      name: r'revenueSalary',
      type: IsarType.double,
    ),
    r'safetyBonus': PropertySchema(
      id: 39,
      name: r'safetyBonus',
      type: IsarType.double,
    ),
    r'totalEmployeeDeductions': PropertySchema(
      id: 40,
      name: r'totalEmployeeDeductions',
      type: IsarType.double,
    ),
    r'totalEmployerCost': PropertySchema(
      id: 41,
      name: r'totalEmployerCost',
      type: IsarType.double,
    ),
    r'tripSalary': PropertySchema(
      id: 42,
      name: r'tripSalary',
      type: IsarType.double,
    ),
    r'unionFee': PropertySchema(
      id: 43,
      name: r'unionFee',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 44,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'workingDays': PropertySchema(
      id: 45,
      name: r'workingDays',
      type: IsarType.double,
    ),
    r'year': PropertySchema(
      id: 46,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _payslipEstimateSize,
  serialize: _payslipSerialize,
  deserialize: _payslipDeserialize,
  deserializeProp: _payslipDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _payslipGetId,
  getLinks: _payslipGetLinks,
  attach: _payslipAttach,
  version: '3.1.0+1',
);

int _payslipEstimateSize(
  Payslip object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.employeeCode.length * 3;
  bytesCount += 3 + object.employeeName.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.position.length * 3;
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _payslipSerialize(
  Payslip object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actualWorkingDays);
  writer.writeDouble(offsets[1], object.advanceDeduction);
  writer.writeDouble(offsets[2], object.allowanceFuel);
  writer.writeDouble(offsets[3], object.allowanceMeal);
  writer.writeDouble(offsets[4], object.allowanceNightStay);
  writer.writeDouble(offsets[5], object.allowancePhone);
  writer.writeDouble(offsets[6], object.baseSalary);
  writer.writeDouble(offsets[7], object.bhtnEmployee);
  writer.writeDouble(offsets[8], object.bhtnEmployer);
  writer.writeDouble(offsets[9], object.bhxhEmployee);
  writer.writeDouble(offsets[10], object.bhxhEmployer);
  writer.writeDouble(offsets[11], object.bhytEmployee);
  writer.writeDouble(offsets[12], object.bhytEmployer);
  writer.writeDouble(offsets[13], object.containerSalary);
  writer.writeDateTime(offsets[14], object.createdAt);
  writer.writeString(offsets[15], object.department);
  writer.writeDouble(offsets[16], object.diligenceBonus);
  writer.writeDouble(offsets[17], object.earnedBaseSalary);
  writer.writeString(offsets[18], object.employeeCode);
  writer.writeLong(offsets[19], object.employeeId);
  writer.writeString(offsets[20], object.employeeName);
  writer.writeDouble(offsets[21], object.fuelSavingBonus);
  writer.writeDateTime(offsets[22], object.generatedAt);
  writer.writeDouble(offsets[23], object.grossSalary);
  writer.writeDouble(offsets[24], object.kmSalary);
  writer.writeDouble(offsets[25], object.kpiBonus);
  writer.writeDateTime(offsets[26], object.lastSyncAt);
  writer.writeLong(offsets[27], object.month);
  writer.writeDouble(offsets[28], object.monthlyBonus);
  writer.writeBool(offsets[29], object.needsSync);
  writer.writeDouble(offsets[30], object.netSalary);
  writer.writeString(offsets[31], object.notes);
  writer.writeDouble(offsets[32], object.otherBonus);
  writer.writeDouble(offsets[33], object.otherDeduction);
  writer.writeDouble(offsets[34], object.overtimeSalary);
  writer.writeDouble(offsets[35], object.personalIncomeTax);
  writer.writeString(offsets[36], object.position);
  writer.writeString(offsets[37], object.remoteId);
  writer.writeDouble(offsets[38], object.revenueSalary);
  writer.writeDouble(offsets[39], object.safetyBonus);
  writer.writeDouble(offsets[40], object.totalEmployeeDeductions);
  writer.writeDouble(offsets[41], object.totalEmployerCost);
  writer.writeDouble(offsets[42], object.tripSalary);
  writer.writeDouble(offsets[43], object.unionFee);
  writer.writeDateTime(offsets[44], object.updatedAt);
  writer.writeDouble(offsets[45], object.workingDays);
  writer.writeLong(offsets[46], object.year);
}

Payslip _payslipDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Payslip();
  object.actualWorkingDays = reader.readDouble(offsets[0]);
  object.advanceDeduction = reader.readDouble(offsets[1]);
  object.allowanceFuel = reader.readDouble(offsets[2]);
  object.allowanceMeal = reader.readDouble(offsets[3]);
  object.allowanceNightStay = reader.readDouble(offsets[4]);
  object.allowancePhone = reader.readDouble(offsets[5]);
  object.baseSalary = reader.readDouble(offsets[6]);
  object.bhtnEmployee = reader.readDouble(offsets[7]);
  object.bhtnEmployer = reader.readDouble(offsets[8]);
  object.bhxhEmployee = reader.readDouble(offsets[9]);
  object.bhxhEmployer = reader.readDouble(offsets[10]);
  object.bhytEmployee = reader.readDouble(offsets[11]);
  object.bhytEmployer = reader.readDouble(offsets[12]);
  object.containerSalary = reader.readDouble(offsets[13]);
  object.createdAt = reader.readDateTime(offsets[14]);
  object.department = reader.readString(offsets[15]);
  object.diligenceBonus = reader.readDouble(offsets[16]);
  object.earnedBaseSalary = reader.readDouble(offsets[17]);
  object.employeeCode = reader.readString(offsets[18]);
  object.employeeId = reader.readLong(offsets[19]);
  object.employeeName = reader.readString(offsets[20]);
  object.fuelSavingBonus = reader.readDouble(offsets[21]);
  object.generatedAt = reader.readDateTimeOrNull(offsets[22]);
  object.grossSalary = reader.readDouble(offsets[23]);
  object.id = id;
  object.kmSalary = reader.readDouble(offsets[24]);
  object.kpiBonus = reader.readDouble(offsets[25]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[26]);
  object.month = reader.readLong(offsets[27]);
  object.monthlyBonus = reader.readDouble(offsets[28]);
  object.needsSync = reader.readBool(offsets[29]);
  object.netSalary = reader.readDouble(offsets[30]);
  object.notes = reader.readStringOrNull(offsets[31]);
  object.otherBonus = reader.readDouble(offsets[32]);
  object.otherDeduction = reader.readDouble(offsets[33]);
  object.overtimeSalary = reader.readDouble(offsets[34]);
  object.personalIncomeTax = reader.readDouble(offsets[35]);
  object.position = reader.readString(offsets[36]);
  object.remoteId = reader.readStringOrNull(offsets[37]);
  object.revenueSalary = reader.readDouble(offsets[38]);
  object.safetyBonus = reader.readDouble(offsets[39]);
  object.totalEmployeeDeductions = reader.readDouble(offsets[40]);
  object.totalEmployerCost = reader.readDouble(offsets[41]);
  object.tripSalary = reader.readDouble(offsets[42]);
  object.unionFee = reader.readDouble(offsets[43]);
  object.updatedAt = reader.readDateTime(offsets[44]);
  object.workingDays = reader.readDouble(offsets[45]);
  object.year = reader.readLong(offsets[46]);
  return object;
}

P _payslipDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readDouble(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readDouble(offset)) as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (reader.readLong(offset)) as P;
    case 28:
      return (reader.readDouble(offset)) as P;
    case 29:
      return (reader.readBool(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readDouble(offset)) as P;
    case 33:
      return (reader.readDouble(offset)) as P;
    case 34:
      return (reader.readDouble(offset)) as P;
    case 35:
      return (reader.readDouble(offset)) as P;
    case 36:
      return (reader.readString(offset)) as P;
    case 37:
      return (reader.readStringOrNull(offset)) as P;
    case 38:
      return (reader.readDouble(offset)) as P;
    case 39:
      return (reader.readDouble(offset)) as P;
    case 40:
      return (reader.readDouble(offset)) as P;
    case 41:
      return (reader.readDouble(offset)) as P;
    case 42:
      return (reader.readDouble(offset)) as P;
    case 43:
      return (reader.readDouble(offset)) as P;
    case 44:
      return (reader.readDateTime(offset)) as P;
    case 45:
      return (reader.readDouble(offset)) as P;
    case 46:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _payslipGetId(Payslip object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _payslipGetLinks(Payslip object) {
  return [];
}

void _payslipAttach(IsarCollection<dynamic> col, Id id, Payslip object) {
  object.id = id;
}

extension PayslipQueryWhereSort on QueryBuilder<Payslip, Payslip, QWhere> {
  QueryBuilder<Payslip, Payslip, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PayslipQueryWhere on QueryBuilder<Payslip, Payslip, QWhereClause> {
  QueryBuilder<Payslip, Payslip, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Payslip, Payslip, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterWhereClause> idBetween(
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

extension PayslipQueryFilter
    on QueryBuilder<Payslip, Payslip, QFilterCondition> {
  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      actualWorkingDaysEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualWorkingDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      actualWorkingDaysGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualWorkingDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      actualWorkingDaysLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualWorkingDays',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      actualWorkingDaysBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualWorkingDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> advanceDeductionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advanceDeduction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      advanceDeductionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'advanceDeduction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      advanceDeductionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'advanceDeduction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> advanceDeductionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'advanceDeduction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowanceFuelEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      allowanceFuelGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowanceFuelLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowanceFuelBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowanceMealEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      allowanceMealGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowanceMealLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowanceMealBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      allowanceNightStayEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      allowanceNightStayBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowancePhoneEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      allowancePhoneGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowancePhoneLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> allowancePhoneBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> baseSalaryEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> baseSalaryGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> baseSalaryLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> baseSalaryBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhtnEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhtnEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhtnEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhtnEmployee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployerEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhtnEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployerGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhtnEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployerLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhtnEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhtnEmployerBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhtnEmployer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhxhEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhxhEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhxhEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhxhEmployee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployerEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhxhEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployerGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhxhEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployerLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhxhEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhxhEmployerBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhxhEmployer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhytEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhytEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhytEmployee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhytEmployee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployerEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bhytEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployerGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bhytEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployerLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bhytEmployer',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> bhytEmployerBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bhytEmployer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> containerSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      containerSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> containerSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> containerSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'department',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'department',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'department',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> diligenceBonusEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diligenceBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      diligenceBonusGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diligenceBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> diligenceBonusLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diligenceBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> diligenceBonusBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diligenceBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> earnedBaseSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'earnedBaseSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      earnedBaseSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'earnedBaseSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      earnedBaseSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'earnedBaseSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> earnedBaseSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'earnedBaseSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeStartsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeEndsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeContains(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeMatches(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      employeeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeIdGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeIdLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeIdBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameStartsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameEndsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> fuelSavingBonusEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fuelSavingBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      fuelSavingBonusGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fuelSavingBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> fuelSavingBonusLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fuelSavingBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> fuelSavingBonusBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fuelSavingBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> generatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generatedAt',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> generatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generatedAt',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> generatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> generatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> generatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> generatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> grossSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grossSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> grossSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grossSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> grossSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grossSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> grossSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grossSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kmSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kmSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kmSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kmSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kmSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kmSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kmSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kmSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kpiBonusEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kpiBonusGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kpiBonusLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> kpiBonusBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthlyBonusEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthlyBonusGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'monthlyBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthlyBonusLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'monthlyBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> monthlyBonusBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'monthlyBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> netSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> netSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> netSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> netSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherBonusEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherBonusGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherBonusLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherBonusBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherDeductionEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherDeduction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      otherDeductionGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherDeduction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherDeductionLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherDeduction',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> otherDeductionBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherDeduction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> overtimeSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overtimeSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      overtimeSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overtimeSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> overtimeSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overtimeSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> overtimeSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overtimeSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      personalIncomeTaxEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalIncomeTax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      personalIncomeTaxGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'personalIncomeTax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      personalIncomeTaxLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'personalIncomeTax',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      personalIncomeTaxBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'personalIncomeTax',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'position',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> positionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdContains(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> revenueSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      revenueSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> revenueSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> revenueSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> safetyBonusEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'safetyBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> safetyBonusGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'safetyBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> safetyBonusLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'safetyBonus',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> safetyBonusBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'safetyBonus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployeeDeductionsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEmployeeDeductions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployeeDeductionsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEmployeeDeductions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployeeDeductionsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEmployeeDeductions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployeeDeductionsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEmployeeDeductions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployerCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalEmployerCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployerCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalEmployerCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployerCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalEmployerCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition>
      totalEmployerCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalEmployerCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> tripSalaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> tripSalaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tripSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> tripSalaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tripSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> tripSalaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tripSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> unionFeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unionFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> unionFeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unionFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> unionFeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unionFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> unionFeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unionFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> workingDaysEqualTo(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> workingDaysGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> workingDaysLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> workingDaysBetween(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> yearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> yearGreaterThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> yearLessThan(
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

  QueryBuilder<Payslip, Payslip, QAfterFilterCondition> yearBetween(
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

extension PayslipQueryObject
    on QueryBuilder<Payslip, Payslip, QFilterCondition> {}

extension PayslipQueryLinks
    on QueryBuilder<Payslip, Payslip, QFilterCondition> {}

extension PayslipQuerySortBy on QueryBuilder<Payslip, Payslip, QSortBy> {
  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByActualWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByActualWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAdvanceDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAdvanceDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowanceFuelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowanceNightStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhtnEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhtnEmployeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhtnEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployer', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhtnEmployerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployer', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhxhEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhxhEmployeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhxhEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployer', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhxhEmployerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployer', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhytEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhytEmployeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhytEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployer', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByBhytEmployerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployer', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByContainerSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByContainerSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByDiligenceBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByDiligenceBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEarnedBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEarnedBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByFuelSavingBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByFuelSavingBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByGrossSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByGrossSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByKmSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByKmSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByKpiBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByMonthlyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByMonthlyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByNetSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByNetSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByOtherBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByOtherBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByOtherDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByOtherDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByOvertimeSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByOvertimeSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByPersonalIncomeTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByPersonalIncomeTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByRevenueSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByRevenueSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortBySafetyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortBySafetyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByTotalEmployeeDeductions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployeeDeductions', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy>
      sortByTotalEmployeeDeductionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployeeDeductions', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByTotalEmployerCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByTotalEmployerCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByTripSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByTripSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByUnionFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByUnionFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PayslipQuerySortThenBy
    on QueryBuilder<Payslip, Payslip, QSortThenBy> {
  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByActualWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByActualWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAdvanceDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAdvanceDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowanceFuelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowanceNightStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhtnEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhtnEmployeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhtnEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployer', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhtnEmployerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhtnEmployer', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhxhEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhxhEmployeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhxhEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployer', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhxhEmployerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhxhEmployer', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhytEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhytEmployeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhytEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployer', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByBhytEmployerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bhytEmployer', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByContainerSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByContainerSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByDiligenceBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByDiligenceBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEarnedBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEarnedBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByFuelSavingBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByFuelSavingBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByGeneratedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByGrossSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByGrossSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByKmSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByKmSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByKpiBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByMonthlyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByMonthlyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByNetSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByNetSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByOtherBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByOtherBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByOtherDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByOtherDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByOvertimeSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByOvertimeSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByPersonalIncomeTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByPersonalIncomeTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByRevenueSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByRevenueSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenBySafetyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenBySafetyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByTotalEmployeeDeductions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployeeDeductions', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy>
      thenByTotalEmployeeDeductionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployeeDeductions', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByTotalEmployerCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByTotalEmployerCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByTripSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByTripSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByUnionFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByUnionFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.desc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Payslip, Payslip, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PayslipQueryWhereDistinct
    on QueryBuilder<Payslip, Payslip, QDistinct> {
  QueryBuilder<Payslip, Payslip, QDistinct> distinctByActualWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualWorkingDays');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByAdvanceDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advanceDeduction');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceFuel');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceMeal');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceNightStay');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowancePhone');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBhtnEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhtnEmployee');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBhtnEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhtnEmployer');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBhxhEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhxhEmployee');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBhxhEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhxhEmployer');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBhytEmployee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhytEmployee');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByBhytEmployer() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bhytEmployer');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByContainerSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByDepartment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByDiligenceBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diligenceBonus');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByEarnedBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'earnedBaseSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByEmployeeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByEmployeeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByFuelSavingBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fuelSavingBonus');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByGeneratedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generatedAt');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByGrossSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByKmSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kmSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kpiBonus');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByMonthlyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyBonus');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByNetSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByOtherBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherBonus');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByOtherDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherDeduction');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByOvertimeSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overtimeSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByPersonalIncomeTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personalIncomeTax');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByPosition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByRevenueSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctBySafetyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'safetyBonus');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct>
      distinctByTotalEmployeeDeductions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEmployeeDeductions');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByTotalEmployerCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEmployerCost');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByTripSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripSalary');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByUnionFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unionFee');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workingDays');
    });
  }

  QueryBuilder<Payslip, Payslip, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension PayslipQueryProperty
    on QueryBuilder<Payslip, Payslip, QQueryProperty> {
  QueryBuilder<Payslip, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> actualWorkingDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualWorkingDays');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> advanceDeductionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advanceDeduction');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> allowanceFuelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceFuel');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> allowanceMealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceMeal');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> allowanceNightStayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceNightStay');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> allowancePhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowancePhone');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> baseSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseSalary');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> bhtnEmployeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhtnEmployee');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> bhtnEmployerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhtnEmployer');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> bhxhEmployeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhxhEmployee');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> bhxhEmployerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhxhEmployer');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> bhytEmployeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhytEmployee');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> bhytEmployerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bhytEmployer');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> containerSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerSalary');
    });
  }

  QueryBuilder<Payslip, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Payslip, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> diligenceBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diligenceBonus');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> earnedBaseSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earnedBaseSalary');
    });
  }

  QueryBuilder<Payslip, String, QQueryOperations> employeeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCode');
    });
  }

  QueryBuilder<Payslip, int, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<Payslip, String, QQueryOperations> employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> fuelSavingBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fuelSavingBonus');
    });
  }

  QueryBuilder<Payslip, DateTime?, QQueryOperations> generatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generatedAt');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> grossSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossSalary');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> kmSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kmSalary');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> kpiBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kpiBonus');
    });
  }

  QueryBuilder<Payslip, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Payslip, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> monthlyBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyBonus');
    });
  }

  QueryBuilder<Payslip, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> netSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netSalary');
    });
  }

  QueryBuilder<Payslip, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> otherBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherBonus');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> otherDeductionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherDeduction');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> overtimeSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overtimeSalary');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> personalIncomeTaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personalIncomeTax');
    });
  }

  QueryBuilder<Payslip, String, QQueryOperations> positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }

  QueryBuilder<Payslip, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> revenueSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueSalary');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> safetyBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'safetyBonus');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations>
      totalEmployeeDeductionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEmployeeDeductions');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> totalEmployerCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEmployerCost');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> tripSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripSalary');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> unionFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unionFee');
    });
  }

  QueryBuilder<Payslip, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Payslip, double, QQueryOperations> workingDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workingDays');
    });
  }

  QueryBuilder<Payslip, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
