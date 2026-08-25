// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payroll.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPayrollCollection on Isar {
  IsarCollection<Payroll> get payrolls => this.collection();
}

const PayrollSchema = CollectionSchema(
  name: r'Payroll',
  id: 367765225041637279,
  properties: {
    r'accidentPenalty': PropertySchema(
      id: 0,
      name: r'accidentPenalty',
      type: IsarType.double,
    ),
    r'actualWorkingDays': PropertySchema(
      id: 1,
      name: r'actualWorkingDays',
      type: IsarType.double,
    ),
    r'advanceDeduction': PropertySchema(
      id: 2,
      name: r'advanceDeduction',
      type: IsarType.double,
    ),
    r'allowanceFuel': PropertySchema(
      id: 3,
      name: r'allowanceFuel',
      type: IsarType.double,
    ),
    r'allowanceMeal': PropertySchema(
      id: 4,
      name: r'allowanceMeal',
      type: IsarType.double,
    ),
    r'allowanceNightStay': PropertySchema(
      id: 5,
      name: r'allowanceNightStay',
      type: IsarType.double,
    ),
    r'allowancePhone': PropertySchema(
      id: 6,
      name: r'allowancePhone',
      type: IsarType.double,
    ),
    r'baseSalary': PropertySchema(
      id: 7,
      name: r'baseSalary',
      type: IsarType.double,
    ),
    r'businessExpense': PropertySchema(
      id: 8,
      name: r'businessExpense',
      type: IsarType.double,
    ),
    r'cargoPenalty': PropertySchema(
      id: 9,
      name: r'cargoPenalty',
      type: IsarType.double,
    ),
    r'containerSalary': PropertySchema(
      id: 10,
      name: r'containerSalary',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 11,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'department': PropertySchema(
      id: 12,
      name: r'department',
      type: IsarType.string,
    ),
    r'diligenceBonus': PropertySchema(
      id: 13,
      name: r'diligenceBonus',
      type: IsarType.double,
    ),
    r'earnedBaseSalary': PropertySchema(
      id: 14,
      name: r'earnedBaseSalary',
      type: IsarType.double,
    ),
    r'employeeCode': PropertySchema(
      id: 15,
      name: r'employeeCode',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 16,
      name: r'employeeId',
      type: IsarType.long,
    ),
    r'employeeName': PropertySchema(
      id: 17,
      name: r'employeeName',
      type: IsarType.string,
    ),
    r'employerBhtn': PropertySchema(
      id: 18,
      name: r'employerBhtn',
      type: IsarType.double,
    ),
    r'employerBhxh': PropertySchema(
      id: 19,
      name: r'employerBhxh',
      type: IsarType.double,
    ),
    r'employerBhyt': PropertySchema(
      id: 20,
      name: r'employerBhyt',
      type: IsarType.double,
    ),
    r'fuelSavingBonus': PropertySchema(
      id: 21,
      name: r'fuelSavingBonus',
      type: IsarType.double,
    ),
    r'grossSalary': PropertySchema(
      id: 22,
      name: r'grossSalary',
      type: IsarType.double,
    ),
    r'healthInsurance': PropertySchema(
      id: 23,
      name: r'healthInsurance',
      type: IsarType.double,
    ),
    r'isDriver': PropertySchema(
      id: 24,
      name: r'isDriver',
      type: IsarType.bool,
    ),
    r'journalRef': PropertySchema(
      id: 25,
      name: r'journalRef',
      type: IsarType.string,
    ),
    r'kmSalary': PropertySchema(
      id: 26,
      name: r'kmSalary',
      type: IsarType.double,
    ),
    r'kpiBonus': PropertySchema(
      id: 27,
      name: r'kpiBonus',
      type: IsarType.double,
    ),
    r'lastSyncAt': PropertySchema(
      id: 28,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'month': PropertySchema(
      id: 29,
      name: r'month',
      type: IsarType.long,
    ),
    r'monthlyBonus': PropertySchema(
      id: 30,
      name: r'monthlyBonus',
      type: IsarType.double,
    ),
    r'needsSync': PropertySchema(
      id: 31,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'netSalary': PropertySchema(
      id: 32,
      name: r'netSalary',
      type: IsarType.double,
    ),
    r'notes': PropertySchema(
      id: 33,
      name: r'notes',
      type: IsarType.string,
    ),
    r'otherBonus': PropertySchema(
      id: 34,
      name: r'otherBonus',
      type: IsarType.double,
    ),
    r'otherDeduction': PropertySchema(
      id: 35,
      name: r'otherDeduction',
      type: IsarType.double,
    ),
    r'otherPenalty': PropertySchema(
      id: 36,
      name: r'otherPenalty',
      type: IsarType.double,
    ),
    r'overtimeSalary': PropertySchema(
      id: 37,
      name: r'overtimeSalary',
      type: IsarType.double,
    ),
    r'paidDate': PropertySchema(
      id: 38,
      name: r'paidDate',
      type: IsarType.dateTime,
    ),
    r'paymentMethod': PropertySchema(
      id: 39,
      name: r'paymentMethod',
      type: IsarType.string,
    ),
    r'personalIncomeTax': PropertySchema(
      id: 40,
      name: r'personalIncomeTax',
      type: IsarType.double,
    ),
    r'position': PropertySchema(
      id: 41,
      name: r'position',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 42,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'revenueSalary': PropertySchema(
      id: 43,
      name: r'revenueSalary',
      type: IsarType.double,
    ),
    r'safetyBonus': PropertySchema(
      id: 44,
      name: r'safetyBonus',
      type: IsarType.double,
    ),
    r'socialInsurance': PropertySchema(
      id: 45,
      name: r'socialInsurance',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 46,
      name: r'status',
      type: IsarType.string,
      enumMap: _PayrollstatusEnumValueMap,
    ),
    r'totalDeductions': PropertySchema(
      id: 47,
      name: r'totalDeductions',
      type: IsarType.double,
    ),
    r'totalEmployerCost': PropertySchema(
      id: 48,
      name: r'totalEmployerCost',
      type: IsarType.double,
    ),
    r'tripSalary': PropertySchema(
      id: 49,
      name: r'tripSalary',
      type: IsarType.double,
    ),
    r'unemploymentInsurance': PropertySchema(
      id: 50,
      name: r'unemploymentInsurance',
      type: IsarType.double,
    ),
    r'unionFee': PropertySchema(
      id: 51,
      name: r'unionFee',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 52,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'violationPenalty': PropertySchema(
      id: 53,
      name: r'violationPenalty',
      type: IsarType.double,
    ),
    r'workingDays': PropertySchema(
      id: 54,
      name: r'workingDays',
      type: IsarType.double,
    ),
    r'year': PropertySchema(
      id: 55,
      name: r'year',
      type: IsarType.long,
    )
  },
  estimateSize: _payrollEstimateSize,
  serialize: _payrollSerialize,
  deserialize: _payrollDeserialize,
  deserializeProp: _payrollDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _payrollGetId,
  getLinks: _payrollGetLinks,
  attach: _payrollAttach,
  version: '3.1.0+1',
);

int _payrollEstimateSize(
  Payroll object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.department.length * 3;
  bytesCount += 3 + object.employeeCode.length * 3;
  bytesCount += 3 + object.employeeName.length * 3;
  {
    final value = object.journalRef;
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
    final value = object.paymentMethod;
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
  bytesCount += 3 + object.status.name.length * 3;
  return bytesCount;
}

void _payrollSerialize(
  Payroll object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accidentPenalty);
  writer.writeDouble(offsets[1], object.actualWorkingDays);
  writer.writeDouble(offsets[2], object.advanceDeduction);
  writer.writeDouble(offsets[3], object.allowanceFuel);
  writer.writeDouble(offsets[4], object.allowanceMeal);
  writer.writeDouble(offsets[5], object.allowanceNightStay);
  writer.writeDouble(offsets[6], object.allowancePhone);
  writer.writeDouble(offsets[7], object.baseSalary);
  writer.writeDouble(offsets[8], object.businessExpense);
  writer.writeDouble(offsets[9], object.cargoPenalty);
  writer.writeDouble(offsets[10], object.containerSalary);
  writer.writeDateTime(offsets[11], object.createdAt);
  writer.writeString(offsets[12], object.department);
  writer.writeDouble(offsets[13], object.diligenceBonus);
  writer.writeDouble(offsets[14], object.earnedBaseSalary);
  writer.writeString(offsets[15], object.employeeCode);
  writer.writeLong(offsets[16], object.employeeId);
  writer.writeString(offsets[17], object.employeeName);
  writer.writeDouble(offsets[18], object.employerBhtn);
  writer.writeDouble(offsets[19], object.employerBhxh);
  writer.writeDouble(offsets[20], object.employerBhyt);
  writer.writeDouble(offsets[21], object.fuelSavingBonus);
  writer.writeDouble(offsets[22], object.grossSalary);
  writer.writeDouble(offsets[23], object.healthInsurance);
  writer.writeBool(offsets[24], object.isDriver);
  writer.writeString(offsets[25], object.journalRef);
  writer.writeDouble(offsets[26], object.kmSalary);
  writer.writeDouble(offsets[27], object.kpiBonus);
  writer.writeDateTime(offsets[28], object.lastSyncAt);
  writer.writeLong(offsets[29], object.month);
  writer.writeDouble(offsets[30], object.monthlyBonus);
  writer.writeBool(offsets[31], object.needsSync);
  writer.writeDouble(offsets[32], object.netSalary);
  writer.writeString(offsets[33], object.notes);
  writer.writeDouble(offsets[34], object.otherBonus);
  writer.writeDouble(offsets[35], object.otherDeduction);
  writer.writeDouble(offsets[36], object.otherPenalty);
  writer.writeDouble(offsets[37], object.overtimeSalary);
  writer.writeDateTime(offsets[38], object.paidDate);
  writer.writeString(offsets[39], object.paymentMethod);
  writer.writeDouble(offsets[40], object.personalIncomeTax);
  writer.writeString(offsets[41], object.position);
  writer.writeString(offsets[42], object.remoteId);
  writer.writeDouble(offsets[43], object.revenueSalary);
  writer.writeDouble(offsets[44], object.safetyBonus);
  writer.writeDouble(offsets[45], object.socialInsurance);
  writer.writeString(offsets[46], object.status.name);
  writer.writeDouble(offsets[47], object.totalDeductions);
  writer.writeDouble(offsets[48], object.totalEmployerCost);
  writer.writeDouble(offsets[49], object.tripSalary);
  writer.writeDouble(offsets[50], object.unemploymentInsurance);
  writer.writeDouble(offsets[51], object.unionFee);
  writer.writeDateTime(offsets[52], object.updatedAt);
  writer.writeDouble(offsets[53], object.violationPenalty);
  writer.writeDouble(offsets[54], object.workingDays);
  writer.writeLong(offsets[55], object.year);
}

Payroll _payrollDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Payroll();
  object.accidentPenalty = reader.readDouble(offsets[0]);
  object.actualWorkingDays = reader.readDouble(offsets[1]);
  object.advanceDeduction = reader.readDouble(offsets[2]);
  object.allowanceFuel = reader.readDouble(offsets[3]);
  object.allowanceMeal = reader.readDouble(offsets[4]);
  object.allowanceNightStay = reader.readDouble(offsets[5]);
  object.allowancePhone = reader.readDouble(offsets[6]);
  object.baseSalary = reader.readDouble(offsets[7]);
  object.businessExpense = reader.readDouble(offsets[8]);
  object.cargoPenalty = reader.readDouble(offsets[9]);
  object.containerSalary = reader.readDouble(offsets[10]);
  object.createdAt = reader.readDateTime(offsets[11]);
  object.department = reader.readString(offsets[12]);
  object.diligenceBonus = reader.readDouble(offsets[13]);
  object.earnedBaseSalary = reader.readDouble(offsets[14]);
  object.employeeCode = reader.readString(offsets[15]);
  object.employeeId = reader.readLong(offsets[16]);
  object.employeeName = reader.readString(offsets[17]);
  object.employerBhtn = reader.readDouble(offsets[18]);
  object.employerBhxh = reader.readDouble(offsets[19]);
  object.employerBhyt = reader.readDouble(offsets[20]);
  object.fuelSavingBonus = reader.readDouble(offsets[21]);
  object.grossSalary = reader.readDouble(offsets[22]);
  object.healthInsurance = reader.readDouble(offsets[23]);
  object.id = id;
  object.isDriver = reader.readBool(offsets[24]);
  object.journalRef = reader.readStringOrNull(offsets[25]);
  object.kmSalary = reader.readDouble(offsets[26]);
  object.kpiBonus = reader.readDouble(offsets[27]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[28]);
  object.month = reader.readLong(offsets[29]);
  object.monthlyBonus = reader.readDouble(offsets[30]);
  object.needsSync = reader.readBool(offsets[31]);
  object.netSalary = reader.readDouble(offsets[32]);
  object.notes = reader.readStringOrNull(offsets[33]);
  object.otherBonus = reader.readDouble(offsets[34]);
  object.otherDeduction = reader.readDouble(offsets[35]);
  object.otherPenalty = reader.readDouble(offsets[36]);
  object.overtimeSalary = reader.readDouble(offsets[37]);
  object.paidDate = reader.readDateTimeOrNull(offsets[38]);
  object.paymentMethod = reader.readStringOrNull(offsets[39]);
  object.personalIncomeTax = reader.readDouble(offsets[40]);
  object.position = reader.readString(offsets[41]);
  object.remoteId = reader.readStringOrNull(offsets[42]);
  object.revenueSalary = reader.readDouble(offsets[43]);
  object.safetyBonus = reader.readDouble(offsets[44]);
  object.socialInsurance = reader.readDouble(offsets[45]);
  object.status =
      _PayrollstatusValueEnumMap[reader.readStringOrNull(offsets[46])] ??
          PayrollStatus.draft;
  object.totalDeductions = reader.readDouble(offsets[47]);
  object.totalEmployerCost = reader.readDouble(offsets[48]);
  object.tripSalary = reader.readDouble(offsets[49]);
  object.unemploymentInsurance = reader.readDouble(offsets[50]);
  object.unionFee = reader.readDouble(offsets[51]);
  object.updatedAt = reader.readDateTime(offsets[52]);
  object.violationPenalty = reader.readDouble(offsets[53]);
  object.workingDays = reader.readDouble(offsets[54]);
  object.year = reader.readLong(offsets[55]);
  return object;
}

P _payrollDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readDouble(offset)) as P;
    case 19:
      return (reader.readDouble(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readDouble(offset)) as P;
    case 22:
      return (reader.readDouble(offset)) as P;
    case 23:
      return (reader.readDouble(offset)) as P;
    case 24:
      return (reader.readBool(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readDouble(offset)) as P;
    case 27:
      return (reader.readDouble(offset)) as P;
    case 28:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 29:
      return (reader.readLong(offset)) as P;
    case 30:
      return (reader.readDouble(offset)) as P;
    case 31:
      return (reader.readBool(offset)) as P;
    case 32:
      return (reader.readDouble(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readDouble(offset)) as P;
    case 35:
      return (reader.readDouble(offset)) as P;
    case 36:
      return (reader.readDouble(offset)) as P;
    case 37:
      return (reader.readDouble(offset)) as P;
    case 38:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 39:
      return (reader.readStringOrNull(offset)) as P;
    case 40:
      return (reader.readDouble(offset)) as P;
    case 41:
      return (reader.readString(offset)) as P;
    case 42:
      return (reader.readStringOrNull(offset)) as P;
    case 43:
      return (reader.readDouble(offset)) as P;
    case 44:
      return (reader.readDouble(offset)) as P;
    case 45:
      return (reader.readDouble(offset)) as P;
    case 46:
      return (_PayrollstatusValueEnumMap[reader.readStringOrNull(offset)] ??
          PayrollStatus.draft) as P;
    case 47:
      return (reader.readDouble(offset)) as P;
    case 48:
      return (reader.readDouble(offset)) as P;
    case 49:
      return (reader.readDouble(offset)) as P;
    case 50:
      return (reader.readDouble(offset)) as P;
    case 51:
      return (reader.readDouble(offset)) as P;
    case 52:
      return (reader.readDateTime(offset)) as P;
    case 53:
      return (reader.readDouble(offset)) as P;
    case 54:
      return (reader.readDouble(offset)) as P;
    case 55:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PayrollstatusEnumValueMap = {
  r'draft': r'draft',
  r'confirmed': r'confirmed',
  r'paid': r'paid',
};
const _PayrollstatusValueEnumMap = {
  r'draft': PayrollStatus.draft,
  r'confirmed': PayrollStatus.confirmed,
  r'paid': PayrollStatus.paid,
};

Id _payrollGetId(Payroll object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _payrollGetLinks(Payroll object) {
  return [];
}

void _payrollAttach(IsarCollection<dynamic> col, Id id, Payroll object) {
  object.id = id;
}

extension PayrollQueryWhereSort on QueryBuilder<Payroll, Payroll, QWhere> {
  QueryBuilder<Payroll, Payroll, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PayrollQueryWhere on QueryBuilder<Payroll, Payroll, QWhereClause> {
  QueryBuilder<Payroll, Payroll, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Payroll, Payroll, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterWhereClause> idBetween(
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

extension PayrollQueryFilter
    on QueryBuilder<Payroll, Payroll, QFilterCondition> {
  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> accidentPenaltyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accidentPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      accidentPenaltyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accidentPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> accidentPenaltyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accidentPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> accidentPenaltyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accidentPenalty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> advanceDeductionEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> advanceDeductionBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowanceFuelEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowanceFuelLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowanceFuelBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowanceMealEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowanceMealLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowanceMealBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowancePhoneEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowancePhoneLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> allowancePhoneBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> baseSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> baseSalaryGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> baseSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> baseSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> businessExpenseEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      businessExpenseGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> businessExpenseLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessExpense',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> businessExpenseBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessExpense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> cargoPenaltyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cargoPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> cargoPenaltyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cargoPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> cargoPenaltyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cargoPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> cargoPenaltyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cargoPenalty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> containerSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> containerSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> containerSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> diligenceBonusEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> diligenceBonusLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> diligenceBonusBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> earnedBaseSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> earnedBaseSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      employeeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeIdGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeIdLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeIdBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employeeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      employeeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeName',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhtnEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employerBhtn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhtnGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employerBhtn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhtnLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employerBhtn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhtnBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employerBhtn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhxhEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employerBhxh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhxhGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employerBhxh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhxhLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employerBhxh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhxhBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employerBhxh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhytEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employerBhyt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhytGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employerBhyt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhytLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employerBhyt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> employerBhytBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employerBhyt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> fuelSavingBonusEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> fuelSavingBonusLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> fuelSavingBonusBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> grossSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> grossSalaryGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> grossSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> grossSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> healthInsuranceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      healthInsuranceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healthInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> healthInsuranceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healthInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> healthInsuranceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healthInsurance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> isDriverEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDriver',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'journalRef',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'journalRef',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'journalRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'journalRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'journalRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'journalRef',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'journalRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'journalRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'journalRef',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'journalRef',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'journalRef',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> journalRefIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'journalRef',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kmSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kmSalaryGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kmSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kmSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kpiBonusEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kpiBonusGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kpiBonusLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> kpiBonusBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthlyBonusEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthlyBonusGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthlyBonusLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> monthlyBonusBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> netSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> netSalaryGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> netSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> netSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherBonusEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherBonusGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherBonusLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherBonusBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherDeductionEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherDeductionLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherDeductionBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherPenaltyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherPenaltyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherPenaltyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> otherPenaltyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherPenalty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> overtimeSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> overtimeSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> overtimeSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paidDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidDate',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paidDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidDate',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paidDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paidDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paidDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paidDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      paymentMethodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paymentMethod',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      paymentMethodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> paymentMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      paymentMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> positionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> revenueSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> revenueSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> revenueSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> safetyBonusEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> safetyBonusGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> safetyBonusLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> safetyBonusBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> socialInsuranceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'socialInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      socialInsuranceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'socialInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> socialInsuranceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'socialInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> socialInsuranceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'socialInsurance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusEqualTo(
    PayrollStatus value, {
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusGreaterThan(
    PayrollStatus value, {
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusLessThan(
    PayrollStatus value, {
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusBetween(
    PayrollStatus lower,
    PayrollStatus upper, {
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> totalDeductionsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDeductions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      totalDeductionsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDeductions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> totalDeductionsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDeductions',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> totalDeductionsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDeductions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> tripSalaryEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> tripSalaryGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> tripSalaryLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> tripSalaryBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      unemploymentInsuranceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unemploymentInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      unemploymentInsuranceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unemploymentInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      unemploymentInsuranceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unemploymentInsurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      unemploymentInsuranceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unemploymentInsurance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> unionFeeEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> unionFeeGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> unionFeeLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> unionFeeBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> violationPenaltyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'violationPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      violationPenaltyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'violationPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition>
      violationPenaltyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'violationPenalty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> violationPenaltyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'violationPenalty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> workingDaysEqualTo(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> workingDaysGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> workingDaysLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> workingDaysBetween(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> yearEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
      ));
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> yearGreaterThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> yearLessThan(
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

  QueryBuilder<Payroll, Payroll, QAfterFilterCondition> yearBetween(
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

extension PayrollQueryObject
    on QueryBuilder<Payroll, Payroll, QFilterCondition> {}

extension PayrollQueryLinks
    on QueryBuilder<Payroll, Payroll, QFilterCondition> {}

extension PayrollQuerySortBy on QueryBuilder<Payroll, Payroll, QSortBy> {
  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAccidentPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAccidentPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByActualWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByActualWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAdvanceDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAdvanceDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowanceFuelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowanceNightStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByBusinessExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessExpense', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByBusinessExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessExpense', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByCargoPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByCargoPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByContainerSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByContainerSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByDiligenceBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByDiligenceBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEarnedBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEarnedBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployerBhtn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhtn', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployerBhtnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhtn', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployerBhxh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhxh', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployerBhxhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhxh', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployerBhyt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhyt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByEmployerBhytDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhyt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByFuelSavingBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByFuelSavingBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByGrossSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByGrossSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByHealthInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByHealthInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByIsDriver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDriver', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByIsDriverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDriver', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByJournalRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalRef', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByJournalRefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalRef', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByKmSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByKmSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByKpiBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByMonthlyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByMonthlyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByNetSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByNetSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOtherBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOtherBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOtherDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOtherDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOtherPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOtherPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOvertimeSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByOvertimeSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPaidDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPersonalIncomeTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPersonalIncomeTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByRevenueSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByRevenueSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortBySafetyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortBySafetyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortBySocialInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsurance', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortBySocialInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsurance', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByTotalDeductions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeductions', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByTotalDeductionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeductions', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByTotalEmployerCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByTotalEmployerCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByTripSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByTripSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByUnemploymentInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsurance', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy>
      sortByUnemploymentInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsurance', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByUnionFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByUnionFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByViolationPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByViolationPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PayrollQuerySortThenBy
    on QueryBuilder<Payroll, Payroll, QSortThenBy> {
  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAccidentPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAccidentPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accidentPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByActualWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByActualWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualWorkingDays', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAdvanceDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAdvanceDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advanceDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowanceFuelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceFuel', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowanceNightStayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceNightStay', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByBusinessExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessExpense', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByBusinessExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessExpense', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByCargoPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByCargoPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cargoPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByContainerSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByContainerSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByDiligenceBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByDiligenceBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diligenceBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEarnedBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEarnedBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'earnedBaseSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployeeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployeeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeName', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployerBhtn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhtn', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployerBhtnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhtn', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployerBhxh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhxh', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployerBhxhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhxh', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployerBhyt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhyt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByEmployerBhytDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employerBhyt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByFuelSavingBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByFuelSavingBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fuelSavingBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByGrossSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByGrossSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grossSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByHealthInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByHealthInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsurance', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByIsDriver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDriver', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByIsDriverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDriver', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByJournalRef() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalRef', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByJournalRefDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'journalRef', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByKmSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByKmSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kmSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByKpiBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kpiBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByMonthlyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByMonthlyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByNetSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByNetSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOtherBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOtherBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOtherDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOtherDeductionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherDeduction', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOtherPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOtherPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOvertimeSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByOvertimeSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overtimeSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPaidDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidDate', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPersonalIncomeTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPersonalIncomeTaxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalIncomeTax', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByRevenueSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByRevenueSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenBySafetyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenBySafetyBonusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'safetyBonus', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenBySocialInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsurance', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenBySocialInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsurance', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByTotalDeductions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeductions', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByTotalDeductionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDeductions', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByTotalEmployerCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByTotalEmployerCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalEmployerCost', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByTripSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByTripSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripSalary', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByUnemploymentInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsurance', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy>
      thenByUnemploymentInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsurance', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByUnionFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByUnionFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unionFee', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByViolationPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationPenalty', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByViolationPenaltyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'violationPenalty', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByWorkingDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workingDays', Sort.desc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Payroll, Payroll, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PayrollQueryWhereDistinct
    on QueryBuilder<Payroll, Payroll, QDistinct> {
  QueryBuilder<Payroll, Payroll, QDistinct> distinctByAccidentPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accidentPenalty');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByActualWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualWorkingDays');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByAdvanceDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advanceDeduction');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByAllowanceFuel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceFuel');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceMeal');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByAllowanceNightStay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceNightStay');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowancePhone');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByBusinessExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessExpense');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByCargoPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cargoPenalty');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByContainerSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByDepartment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByDiligenceBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diligenceBonus');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEarnedBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'earnedBaseSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEmployeeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEmployeeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEmployerBhtn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employerBhtn');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEmployerBhxh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employerBhxh');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByEmployerBhyt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employerBhyt');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByFuelSavingBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fuelSavingBonus');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByGrossSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grossSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByHealthInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthInsurance');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByIsDriver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDriver');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByJournalRef(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'journalRef', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByKmSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kmSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByKpiBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kpiBonus');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByMonthlyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyBonus');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByNetSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByOtherBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherBonus');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByOtherDeduction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherDeduction');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByOtherPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherPenalty');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByOvertimeSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overtimeSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByPaidDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidDate');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByPaymentMethod(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByPersonalIncomeTax() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personalIncomeTax');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByPosition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByRevenueSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctBySafetyBonus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'safetyBonus');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctBySocialInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'socialInsurance');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByTotalDeductions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDeductions');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByTotalEmployerCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalEmployerCost');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByTripSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripSalary');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByUnemploymentInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unemploymentInsurance');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByUnionFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unionFee');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByViolationPenalty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'violationPenalty');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByWorkingDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workingDays');
    });
  }

  QueryBuilder<Payroll, Payroll, QDistinct> distinctByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year');
    });
  }
}

extension PayrollQueryProperty
    on QueryBuilder<Payroll, Payroll, QQueryProperty> {
  QueryBuilder<Payroll, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> accidentPenaltyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accidentPenalty');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> actualWorkingDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualWorkingDays');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> advanceDeductionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advanceDeduction');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> allowanceFuelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceFuel');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> allowanceMealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceMeal');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> allowanceNightStayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceNightStay');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> allowancePhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowancePhone');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> baseSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseSalary');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> businessExpenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessExpense');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> cargoPenaltyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cargoPenalty');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> containerSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerSalary');
    });
  }

  QueryBuilder<Payroll, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Payroll, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> diligenceBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diligenceBonus');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> earnedBaseSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'earnedBaseSalary');
    });
  }

  QueryBuilder<Payroll, String, QQueryOperations> employeeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCode');
    });
  }

  QueryBuilder<Payroll, int, QQueryOperations> employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<Payroll, String, QQueryOperations> employeeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeName');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> employerBhtnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employerBhtn');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> employerBhxhProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employerBhxh');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> employerBhytProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employerBhyt');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> fuelSavingBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fuelSavingBonus');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> grossSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grossSalary');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> healthInsuranceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthInsurance');
    });
  }

  QueryBuilder<Payroll, bool, QQueryOperations> isDriverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDriver');
    });
  }

  QueryBuilder<Payroll, String?, QQueryOperations> journalRefProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'journalRef');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> kmSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kmSalary');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> kpiBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kpiBonus');
    });
  }

  QueryBuilder<Payroll, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Payroll, int, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> monthlyBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyBonus');
    });
  }

  QueryBuilder<Payroll, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> netSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netSalary');
    });
  }

  QueryBuilder<Payroll, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> otherBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherBonus');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> otherDeductionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherDeduction');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> otherPenaltyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherPenalty');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> overtimeSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overtimeSalary');
    });
  }

  QueryBuilder<Payroll, DateTime?, QQueryOperations> paidDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidDate');
    });
  }

  QueryBuilder<Payroll, String?, QQueryOperations> paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> personalIncomeTaxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personalIncomeTax');
    });
  }

  QueryBuilder<Payroll, String, QQueryOperations> positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }

  QueryBuilder<Payroll, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> revenueSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueSalary');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> safetyBonusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'safetyBonus');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> socialInsuranceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'socialInsurance');
    });
  }

  QueryBuilder<Payroll, PayrollStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> totalDeductionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDeductions');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> totalEmployerCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalEmployerCost');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> tripSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripSalary');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations>
      unemploymentInsuranceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unemploymentInsurance');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> unionFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unionFee');
    });
  }

  QueryBuilder<Payroll, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> violationPenaltyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'violationPenalty');
    });
  }

  QueryBuilder<Payroll, double, QQueryOperations> workingDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workingDays');
    });
  }

  QueryBuilder<Payroll, int, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}
