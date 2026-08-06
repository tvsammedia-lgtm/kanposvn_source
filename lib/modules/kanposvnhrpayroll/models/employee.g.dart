// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmployeeCollection on Isar {
  IsarCollection<Employee> get employees => this.collection();
}

const EmployeeSchema = CollectionSchema(
  name: r'Employee',
  id: 3568472634033989540,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'allowanceMeal': PropertySchema(
      id: 1,
      name: r'allowanceMeal',
      type: IsarType.double,
    ),
    r'allowancePhone': PropertySchema(
      id: 2,
      name: r'allowancePhone',
      type: IsarType.double,
    ),
    r'allowanceTransport': PropertySchema(
      id: 3,
      name: r'allowanceTransport',
      type: IsarType.double,
    ),
    r'annualLeaveTotal': PropertySchema(
      id: 4,
      name: r'annualLeaveTotal',
      type: IsarType.long,
    ),
    r'annualLeaveUsed': PropertySchema(
      id: 5,
      name: r'annualLeaveUsed',
      type: IsarType.long,
    ),
    r'avatarPath': PropertySchema(
      id: 6,
      name: r'avatarPath',
      type: IsarType.string,
    ),
    r'bankAccount': PropertySchema(
      id: 7,
      name: r'bankAccount',
      type: IsarType.string,
    ),
    r'bankName': PropertySchema(
      id: 8,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'baseSalary': PropertySchema(
      id: 9,
      name: r'baseSalary',
      type: IsarType.double,
    ),
    r'birthDate': PropertySchema(
      id: 10,
      name: r'birthDate',
      type: IsarType.dateTime,
    ),
    r'cccd': PropertySchema(
      id: 11,
      name: r'cccd',
      type: IsarType.string,
    ),
    r'cccdIssueDate': PropertySchema(
      id: 12,
      name: r'cccdIssueDate',
      type: IsarType.dateTime,
    ),
    r'cccdIssuePlace': PropertySchema(
      id: 13,
      name: r'cccdIssuePlace',
      type: IsarType.string,
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
    r'dependents': PropertySchema(
      id: 16,
      name: r'dependents',
      type: IsarType.long,
    ),
    r'email': PropertySchema(
      id: 17,
      name: r'email',
      type: IsarType.string,
    ),
    r'emergencyContact': PropertySchema(
      id: 18,
      name: r'emergencyContact',
      type: IsarType.string,
    ),
    r'emergencyPhone': PropertySchema(
      id: 19,
      name: r'emergencyPhone',
      type: IsarType.string,
    ),
    r'employeeCode': PropertySchema(
      id: 20,
      name: r'employeeCode',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 21,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 22,
      name: r'gender',
      type: IsarType.string,
      enumMap: _EmployeegenderEnumValueMap,
    ),
    r'hasSocialInsurance': PropertySchema(
      id: 23,
      name: r'hasSocialInsurance',
      type: IsarType.bool,
    ),
    r'healthInsuranceRate': PropertySchema(
      id: 24,
      name: r'healthInsuranceRate',
      type: IsarType.double,
    ),
    r'joinDate': PropertySchema(
      id: 25,
      name: r'joinDate',
      type: IsarType.dateTime,
    ),
    r'lastSyncAt': PropertySchema(
      id: 26,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'maritalStatus': PropertySchema(
      id: 27,
      name: r'maritalStatus',
      type: IsarType.string,
      enumMap: _EmployeemaritalStatusEnumValueMap,
    ),
    r'needsSync': PropertySchema(
      id: 28,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'phone': PropertySchema(
      id: 29,
      name: r'phone',
      type: IsarType.string,
    ),
    r'position': PropertySchema(
      id: 30,
      name: r'position',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 31,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'resignDate': PropertySchema(
      id: 32,
      name: r'resignDate',
      type: IsarType.dateTime,
    ),
    r'socialInsuranceCode': PropertySchema(
      id: 33,
      name: r'socialInsuranceCode',
      type: IsarType.string,
    ),
    r'socialInsuranceRate': PropertySchema(
      id: 34,
      name: r'socialInsuranceRate',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 35,
      name: r'status',
      type: IsarType.string,
      enumMap: _EmployeestatusEnumValueMap,
    ),
    r'taxCode': PropertySchema(
      id: 36,
      name: r'taxCode',
      type: IsarType.string,
    ),
    r'unemploymentInsuranceRate': PropertySchema(
      id: 37,
      name: r'unemploymentInsuranceRate',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 38,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _employeeEstimateSize,
  serialize: _employeeSerialize,
  deserialize: _employeeDeserialize,
  deserializeProp: _employeeDeserializeProp,
  idName: r'id',
  indexes: {
    r'employeeCode': IndexSchema(
      id: 7493838445661731167,
      name: r'employeeCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'employeeCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _employeeGetId,
  getLinks: _employeeGetLinks,
  attach: _employeeAttach,
  version: '3.1.0+1',
);

int _employeeEstimateSize(
  Employee object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.avatarPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bankAccount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bankName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cccd;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cccdIssuePlace;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.department.length * 3;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emergencyContact;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emergencyPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.employeeCode.length * 3;
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.gender.name.length * 3;
  bytesCount += 3 + object.maritalStatus.name.length * 3;
  {
    final value = object.phone;
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
  {
    final value = object.socialInsuranceCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.taxCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _employeeSerialize(
  Employee object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeDouble(offsets[1], object.allowanceMeal);
  writer.writeDouble(offsets[2], object.allowancePhone);
  writer.writeDouble(offsets[3], object.allowanceTransport);
  writer.writeLong(offsets[4], object.annualLeaveTotal);
  writer.writeLong(offsets[5], object.annualLeaveUsed);
  writer.writeString(offsets[6], object.avatarPath);
  writer.writeString(offsets[7], object.bankAccount);
  writer.writeString(offsets[8], object.bankName);
  writer.writeDouble(offsets[9], object.baseSalary);
  writer.writeDateTime(offsets[10], object.birthDate);
  writer.writeString(offsets[11], object.cccd);
  writer.writeDateTime(offsets[12], object.cccdIssueDate);
  writer.writeString(offsets[13], object.cccdIssuePlace);
  writer.writeDateTime(offsets[14], object.createdAt);
  writer.writeString(offsets[15], object.department);
  writer.writeLong(offsets[16], object.dependents);
  writer.writeString(offsets[17], object.email);
  writer.writeString(offsets[18], object.emergencyContact);
  writer.writeString(offsets[19], object.emergencyPhone);
  writer.writeString(offsets[20], object.employeeCode);
  writer.writeString(offsets[21], object.fullName);
  writer.writeString(offsets[22], object.gender.name);
  writer.writeBool(offsets[23], object.hasSocialInsurance);
  writer.writeDouble(offsets[24], object.healthInsuranceRate);
  writer.writeDateTime(offsets[25], object.joinDate);
  writer.writeDateTime(offsets[26], object.lastSyncAt);
  writer.writeString(offsets[27], object.maritalStatus.name);
  writer.writeBool(offsets[28], object.needsSync);
  writer.writeString(offsets[29], object.phone);
  writer.writeString(offsets[30], object.position);
  writer.writeString(offsets[31], object.remoteId);
  writer.writeDateTime(offsets[32], object.resignDate);
  writer.writeString(offsets[33], object.socialInsuranceCode);
  writer.writeDouble(offsets[34], object.socialInsuranceRate);
  writer.writeString(offsets[35], object.status.name);
  writer.writeString(offsets[36], object.taxCode);
  writer.writeDouble(offsets[37], object.unemploymentInsuranceRate);
  writer.writeDateTime(offsets[38], object.updatedAt);
}

Employee _employeeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Employee();
  object.address = reader.readStringOrNull(offsets[0]);
  object.allowanceMeal = reader.readDouble(offsets[1]);
  object.allowancePhone = reader.readDouble(offsets[2]);
  object.allowanceTransport = reader.readDouble(offsets[3]);
  object.annualLeaveTotal = reader.readLong(offsets[4]);
  object.annualLeaveUsed = reader.readLong(offsets[5]);
  object.avatarPath = reader.readStringOrNull(offsets[6]);
  object.bankAccount = reader.readStringOrNull(offsets[7]);
  object.bankName = reader.readStringOrNull(offsets[8]);
  object.baseSalary = reader.readDouble(offsets[9]);
  object.birthDate = reader.readDateTimeOrNull(offsets[10]);
  object.cccd = reader.readStringOrNull(offsets[11]);
  object.cccdIssueDate = reader.readDateTimeOrNull(offsets[12]);
  object.cccdIssuePlace = reader.readStringOrNull(offsets[13]);
  object.createdAt = reader.readDateTime(offsets[14]);
  object.department = reader.readString(offsets[15]);
  object.dependents = reader.readLong(offsets[16]);
  object.email = reader.readStringOrNull(offsets[17]);
  object.emergencyContact = reader.readStringOrNull(offsets[18]);
  object.emergencyPhone = reader.readStringOrNull(offsets[19]);
  object.employeeCode = reader.readString(offsets[20]);
  object.fullName = reader.readString(offsets[21]);
  object.gender =
      _EmployeegenderValueEnumMap[reader.readStringOrNull(offsets[22])] ??
          Gender.male;
  object.hasSocialInsurance = reader.readBool(offsets[23]);
  object.healthInsuranceRate = reader.readDouble(offsets[24]);
  object.id = id;
  object.joinDate = reader.readDateTimeOrNull(offsets[25]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[26]);
  object.maritalStatus = _EmployeemaritalStatusValueEnumMap[
          reader.readStringOrNull(offsets[27])] ??
      MaritalStatus.single;
  object.needsSync = reader.readBool(offsets[28]);
  object.phone = reader.readStringOrNull(offsets[29]);
  object.position = reader.readString(offsets[30]);
  object.remoteId = reader.readStringOrNull(offsets[31]);
  object.resignDate = reader.readDateTimeOrNull(offsets[32]);
  object.socialInsuranceCode = reader.readStringOrNull(offsets[33]);
  object.socialInsuranceRate = reader.readDouble(offsets[34]);
  object.status =
      _EmployeestatusValueEnumMap[reader.readStringOrNull(offsets[35])] ??
          EmployeeStatus.active;
  object.taxCode = reader.readStringOrNull(offsets[36]);
  object.unemploymentInsuranceRate = reader.readDouble(offsets[37]);
  object.updatedAt = reader.readDateTime(offsets[38]);
  return object;
}

P _employeeDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (_EmployeegenderValueEnumMap[reader.readStringOrNull(offset)] ??
          Gender.male) as P;
    case 23:
      return (reader.readBool(offset)) as P;
    case 24:
      return (reader.readDouble(offset)) as P;
    case 25:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (_EmployeemaritalStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MaritalStatus.single) as P;
    case 28:
      return (reader.readBool(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readString(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readDouble(offset)) as P;
    case 35:
      return (_EmployeestatusValueEnumMap[reader.readStringOrNull(offset)] ??
          EmployeeStatus.active) as P;
    case 36:
      return (reader.readStringOrNull(offset)) as P;
    case 37:
      return (reader.readDouble(offset)) as P;
    case 38:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EmployeegenderEnumValueMap = {
  r'male': r'male',
  r'female': r'female',
  r'other': r'other',
};
const _EmployeegenderValueEnumMap = {
  r'male': Gender.male,
  r'female': Gender.female,
  r'other': Gender.other,
};
const _EmployeemaritalStatusEnumValueMap = {
  r'single': r'single',
  r'married': r'married',
  r'divorced': r'divorced',
  r'widowed': r'widowed',
};
const _EmployeemaritalStatusValueEnumMap = {
  r'single': MaritalStatus.single,
  r'married': MaritalStatus.married,
  r'divorced': MaritalStatus.divorced,
  r'widowed': MaritalStatus.widowed,
};
const _EmployeestatusEnumValueMap = {
  r'active': r'active',
  r'resigned': r'resigned',
  r'suspended': r'suspended',
  r'maternity': r'maternity',
};
const _EmployeestatusValueEnumMap = {
  r'active': EmployeeStatus.active,
  r'resigned': EmployeeStatus.resigned,
  r'suspended': EmployeeStatus.suspended,
  r'maternity': EmployeeStatus.maternity,
};

Id _employeeGetId(Employee object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _employeeGetLinks(Employee object) {
  return [];
}

void _employeeAttach(IsarCollection<dynamic> col, Id id, Employee object) {
  object.id = id;
}

extension EmployeeByIndex on IsarCollection<Employee> {
  Future<Employee?> getByEmployeeCode(String employeeCode) {
    return getByIndex(r'employeeCode', [employeeCode]);
  }

  Employee? getByEmployeeCodeSync(String employeeCode) {
    return getByIndexSync(r'employeeCode', [employeeCode]);
  }

  Future<bool> deleteByEmployeeCode(String employeeCode) {
    return deleteByIndex(r'employeeCode', [employeeCode]);
  }

  bool deleteByEmployeeCodeSync(String employeeCode) {
    return deleteByIndexSync(r'employeeCode', [employeeCode]);
  }

  Future<List<Employee?>> getAllByEmployeeCode(
      List<String> employeeCodeValues) {
    final values = employeeCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'employeeCode', values);
  }

  List<Employee?> getAllByEmployeeCodeSync(List<String> employeeCodeValues) {
    final values = employeeCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'employeeCode', values);
  }

  Future<int> deleteAllByEmployeeCode(List<String> employeeCodeValues) {
    final values = employeeCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'employeeCode', values);
  }

  int deleteAllByEmployeeCodeSync(List<String> employeeCodeValues) {
    final values = employeeCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'employeeCode', values);
  }

  Future<Id> putByEmployeeCode(Employee object) {
    return putByIndex(r'employeeCode', object);
  }

  Id putByEmployeeCodeSync(Employee object, {bool saveLinks = true}) {
    return putByIndexSync(r'employeeCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEmployeeCode(List<Employee> objects) {
    return putAllByIndex(r'employeeCode', objects);
  }

  List<Id> putAllByEmployeeCodeSync(List<Employee> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'employeeCode', objects, saveLinks: saveLinks);
  }
}

extension EmployeeQueryWhereSort on QueryBuilder<Employee, Employee, QWhere> {
  QueryBuilder<Employee, Employee, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EmployeeQueryWhere on QueryBuilder<Employee, Employee, QWhereClause> {
  QueryBuilder<Employee, Employee, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Employee, Employee, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> idBetween(
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

  QueryBuilder<Employee, Employee, QAfterWhereClause> employeeCodeEqualTo(
      String employeeCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'employeeCode',
        value: [employeeCode],
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterWhereClause> employeeCodeNotEqualTo(
      String employeeCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeCode',
              lower: [],
              upper: [employeeCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeCode',
              lower: [employeeCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeCode',
              lower: [employeeCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeCode',
              lower: [],
              upper: [employeeCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension EmployeeQueryFilter
    on QueryBuilder<Employee, Employee, QFilterCondition> {
  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> allowanceMealEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> allowanceMealLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> allowanceMealBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> allowancePhoneEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      allowancePhoneLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> allowancePhoneBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      allowanceTransportEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allowanceTransport',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      allowanceTransportGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allowanceTransport',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      allowanceTransportLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allowanceTransport',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      allowanceTransportBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allowanceTransport',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveTotalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualLeaveTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveTotalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualLeaveTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveTotalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualLeaveTotal',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveTotalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualLeaveTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveUsedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualLeaveUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveUsedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualLeaveUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveUsedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualLeaveUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      annualLeaveUsedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualLeaveUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatarPath',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      avatarPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatarPath',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> avatarPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      avatarPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankAccount',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      bankAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankAccount',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      bankAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      bankAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bankName',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> baseSalaryEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> baseSalaryGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> baseSalaryLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> baseSalaryBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> birthDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> birthDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> birthDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> birthDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> birthDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> birthDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccd',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccd',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccd',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccd',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccdIssueDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccdIssueDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIssueDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccdIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIssueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccdIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIssueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccdIssueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccdIssuePlace',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccdIssuePlace',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIssuePlaceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdIssuePlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccdIssuePlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccdIssuePlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIssuePlaceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccdIssuePlace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccdIssuePlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccdIssuePlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccdIssuePlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> cccdIssuePlaceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccdIssuePlace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdIssuePlace',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      cccdIssuePlaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccdIssuePlace',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentStartsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentEndsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentContains(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentMatches(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> departmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      departmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'department',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> dependentsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dependents',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> dependentsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dependents',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> dependentsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dependents',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> dependentsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dependents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emergencyContact',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emergencyContact',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emergencyContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emergencyContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emergencyContact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emergencyContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emergencyContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emergencyContact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emergencyContact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyContact',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyContactIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emergencyContact',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emergencyPhone',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emergencyPhone',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emergencyPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emergencyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emergencyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emergencyPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emergencyPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emergencyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emergencyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emergencyPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> emergencyPhoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emergencyPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emergencyPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      emergencyPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emergencyPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> employeeCodeEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> employeeCodeLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> employeeCodeBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> employeeCodeEndsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> employeeCodeContains(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> employeeCodeMatches(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      employeeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      employeeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameStartsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameEndsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameContains(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameMatches(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderEqualTo(
    Gender value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderGreaterThan(
    Gender value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderLessThan(
    Gender value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderBetween(
    Gender lower,
    Gender upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      hasSocialInsuranceEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasSocialInsurance',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      healthInsuranceRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'healthInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      healthInsuranceRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'healthInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      healthInsuranceRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'healthInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      healthInsuranceRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'healthInsuranceRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> joinDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'joinDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> joinDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'joinDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> joinDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'joinDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> joinDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'joinDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> joinDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'joinDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> joinDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'joinDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> maritalStatusEqualTo(
    MaritalStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      maritalStatusGreaterThan(
    MaritalStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> maritalStatusLessThan(
    MaritalStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> maritalStatusBetween(
    MaritalStatus lower,
    MaritalStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maritalStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      maritalStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> maritalStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> maritalStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> maritalStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maritalStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      maritalStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maritalStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      maritalStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maritalStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionStartsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionEndsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionContains(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionMatches(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> positionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdContains(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> resignDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resignDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      resignDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resignDate',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> resignDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resignDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> resignDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resignDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> resignDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resignDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> resignDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resignDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'socialInsuranceCode',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'socialInsuranceCode',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'socialInsuranceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'socialInsuranceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'socialInsuranceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'socialInsuranceCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'socialInsuranceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'socialInsuranceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'socialInsuranceCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'socialInsuranceCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'socialInsuranceCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'socialInsuranceCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'socialInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'socialInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'socialInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      socialInsuranceRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'socialInsuranceRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusEqualTo(
    EmployeeStatus value, {
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusGreaterThan(
    EmployeeStatus value, {
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusLessThan(
    EmployeeStatus value, {
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusBetween(
    EmployeeStatus lower,
    EmployeeStatus upper, {
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusContains(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxCode',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxCode',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> taxCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      unemploymentInsuranceRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unemploymentInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      unemploymentInsuranceRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unemploymentInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      unemploymentInsuranceRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unemploymentInsuranceRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition>
      unemploymentInsuranceRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unemploymentInsuranceRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Employee, Employee, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Employee, Employee, QAfterFilterCondition> updatedAtBetween(
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

extension EmployeeQueryObject
    on QueryBuilder<Employee, Employee, QFilterCondition> {}

extension EmployeeQueryLinks
    on QueryBuilder<Employee, Employee, QFilterCondition> {}

extension EmployeeQuerySortBy on QueryBuilder<Employee, Employee, QSortBy> {
  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAllowanceTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceTransport', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortByAllowanceTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceTransport', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAnnualLeaveTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveTotal', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAnnualLeaveTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveTotal', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAnnualLeaveUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveUsed', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAnnualLeaveUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveUsed', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAvatarPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByAvatarPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccount', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBankAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccount', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCccdIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssueDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCccdIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssueDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCccdIssuePlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssuePlace', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCccdIssuePlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssuePlace', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByDependents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dependents', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByDependentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dependents', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmergencyContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContact', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmergencyContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContact', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmergencyPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyPhone', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmergencyPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyPhone', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByHasSocialInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSocialInsurance', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortByHasSocialInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSocialInsurance', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByHealthInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsuranceRate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortByHealthInsuranceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsuranceRate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByJoinDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByJoinDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByMaritalStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByMaritalStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByResignDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resignDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByResignDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resignDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortBySocialInsuranceCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceCode', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortBySocialInsuranceCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceCode', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortBySocialInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceRate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortBySocialInsuranceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceRate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortByUnemploymentInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsuranceRate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      sortByUnemploymentInsuranceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsuranceRate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EmployeeQuerySortThenBy
    on QueryBuilder<Employee, Employee, QSortThenBy> {
  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAllowanceMealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceMeal', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAllowancePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowancePhone', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAllowanceTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceTransport', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenByAllowanceTransportDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allowanceTransport', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAnnualLeaveTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveTotal', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAnnualLeaveTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveTotal', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAnnualLeaveUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveUsed', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAnnualLeaveUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualLeaveUsed', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAvatarPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByAvatarPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarPath', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccount', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBankAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankAccount', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBaseSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseSalary', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccd', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCccdIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssueDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCccdIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssueDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCccdIssuePlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssuePlace', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCccdIssuePlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdIssuePlace', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'department', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByDependents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dependents', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByDependentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dependents', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmergencyContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContact', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmergencyContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyContact', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmergencyPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyPhone', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmergencyPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emergencyPhone', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmployeeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByEmployeeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCode', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByHasSocialInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSocialInsurance', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenByHasSocialInsuranceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasSocialInsurance', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByHealthInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsuranceRate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenByHealthInsuranceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'healthInsuranceRate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByJoinDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByJoinDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByMaritalStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByMaritalStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByResignDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resignDate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByResignDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resignDate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenBySocialInsuranceCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceCode', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenBySocialInsuranceCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceCode', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenBySocialInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceRate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenBySocialInsuranceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'socialInsuranceRate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenByUnemploymentInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsuranceRate', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy>
      thenByUnemploymentInsuranceRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unemploymentInsuranceRate', Sort.desc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Employee, Employee, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EmployeeQueryWhereDistinct
    on QueryBuilder<Employee, Employee, QDistinct> {
  QueryBuilder<Employee, Employee, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByAllowanceMeal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceMeal');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByAllowancePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowancePhone');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByAllowanceTransport() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allowanceTransport');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByAnnualLeaveTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualLeaveTotal');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByAnnualLeaveUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualLeaveUsed');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByAvatarPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByBankAccount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankAccount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByBankName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByBaseSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseSalary');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByCccd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByCccdIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccdIssueDate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByCccdIssuePlace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccdIssuePlace',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByDepartment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'department', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByDependents() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dependents');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByEmergencyContact(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emergencyContact',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByEmergencyPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emergencyPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByEmployeeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByHasSocialInsurance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasSocialInsurance');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByHealthInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'healthInsuranceRate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByJoinDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'joinDate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByMaritalStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maritalStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByPosition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByResignDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resignDate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctBySocialInsuranceCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'socialInsuranceCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctBySocialInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'socialInsuranceRate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByTaxCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Employee, Employee, QDistinct>
      distinctByUnemploymentInsuranceRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unemploymentInsuranceRate');
    });
  }

  QueryBuilder<Employee, Employee, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension EmployeeQueryProperty
    on QueryBuilder<Employee, Employee, QQueryProperty> {
  QueryBuilder<Employee, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations> allowanceMealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceMeal');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations> allowancePhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowancePhone');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations>
      allowanceTransportProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allowanceTransport');
    });
  }

  QueryBuilder<Employee, int, QQueryOperations> annualLeaveTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualLeaveTotal');
    });
  }

  QueryBuilder<Employee, int, QQueryOperations> annualLeaveUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualLeaveUsed');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> avatarPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarPath');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> bankAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankAccount');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations> baseSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseSalary');
    });
  }

  QueryBuilder<Employee, DateTime?, QQueryOperations> birthDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDate');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> cccdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccd');
    });
  }

  QueryBuilder<Employee, DateTime?, QQueryOperations> cccdIssueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccdIssueDate');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> cccdIssuePlaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccdIssuePlace');
    });
  }

  QueryBuilder<Employee, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Employee, String, QQueryOperations> departmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'department');
    });
  }

  QueryBuilder<Employee, int, QQueryOperations> dependentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dependents');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> emergencyContactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emergencyContact');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> emergencyPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emergencyPhone');
    });
  }

  QueryBuilder<Employee, String, QQueryOperations> employeeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCode');
    });
  }

  QueryBuilder<Employee, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<Employee, Gender, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<Employee, bool, QQueryOperations> hasSocialInsuranceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasSocialInsurance');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations>
      healthInsuranceRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'healthInsuranceRate');
    });
  }

  QueryBuilder<Employee, DateTime?, QQueryOperations> joinDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'joinDate');
    });
  }

  QueryBuilder<Employee, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Employee, MaritalStatus, QQueryOperations>
      maritalStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maritalStatus');
    });
  }

  QueryBuilder<Employee, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<Employee, String, QQueryOperations> positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Employee, DateTime?, QQueryOperations> resignDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resignDate');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations>
      socialInsuranceCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'socialInsuranceCode');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations>
      socialInsuranceRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'socialInsuranceRate');
    });
  }

  QueryBuilder<Employee, EmployeeStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Employee, String?, QQueryOperations> taxCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxCode');
    });
  }

  QueryBuilder<Employee, double, QQueryOperations>
      unemploymentInsuranceRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unemploymentInsuranceRate');
    });
  }

  QueryBuilder<Employee, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
