// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccountCollection on Isar {
  IsarCollection<Account> get accounts => this.collection();
}

const AccountSchema = CollectionSchema(
  name: r'Account',
  id: -6646797162501847804,
  properties: {
    r'accountCategoryKind': PropertySchema(
      id: 0,
      name: r'accountCategoryKind',
      type: IsarType.string,
      enumMap: _AccountaccountCategoryKindEnumValueMap,
    ),
    r'accountName': PropertySchema(
      id: 1,
      name: r'accountName',
      type: IsarType.string,
    ),
    r'accountNameEnglish': PropertySchema(
      id: 2,
      name: r'accountNameEnglish',
      type: IsarType.string,
    ),
    r'accountNumber': PropertySchema(
      id: 3,
      name: r'accountNumber',
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
    r'detailByAccountObject': PropertySchema(
      id: 6,
      name: r'detailByAccountObject',
      type: IsarType.bool,
    ),
    r'detailByBankAccount': PropertySchema(
      id: 7,
      name: r'detailByBankAccount',
      type: IsarType.bool,
    ),
    r'detailByContract': PropertySchema(
      id: 8,
      name: r'detailByContract',
      type: IsarType.bool,
    ),
    r'detailByDepartment': PropertySchema(
      id: 9,
      name: r'detailByDepartment',
      type: IsarType.bool,
    ),
    r'detailByExpenseItem': PropertySchema(
      id: 10,
      name: r'detailByExpenseItem',
      type: IsarType.bool,
    ),
    r'detailByJob': PropertySchema(
      id: 11,
      name: r'detailByJob',
      type: IsarType.bool,
    ),
    r'detailByOrder': PropertySchema(
      id: 12,
      name: r'detailByOrder',
      type: IsarType.bool,
    ),
    r'detailByProjectWork': PropertySchema(
      id: 13,
      name: r'detailByProjectWork',
      type: IsarType.bool,
    ),
    r'grade': PropertySchema(
      id: 14,
      name: r'grade',
      type: IsarType.long,
    ),
    r'inactive': PropertySchema(
      id: 15,
      name: r'inactive',
      type: IsarType.bool,
    ),
    r'isParent': PropertySchema(
      id: 16,
      name: r'isParent',
      type: IsarType.bool,
    ),
    r'lastSyncAt': PropertySchema(
      id: 17,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'needsSync': PropertySchema(
      id: 18,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'parentId': PropertySchema(
      id: 19,
      name: r'parentId',
      type: IsarType.long,
    ),
    r'remoteId': PropertySchema(
      id: 20,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 21,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _accountEstimateSize,
  serialize: _accountSerialize,
  deserialize: _accountDeserialize,
  deserializeProp: _accountDeserializeProp,
  idName: r'id',
  indexes: {
    r'accountNumber': IndexSchema(
      id: -3113303652791322435,
      name: r'accountNumber',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'accountNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _accountGetId,
  getLinks: _accountGetLinks,
  attach: _accountAttach,
  version: '3.1.0+1',
);

int _accountEstimateSize(
  Account object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountCategoryKind.name.length * 3;
  bytesCount += 3 + object.accountName.length * 3;
  {
    final value = object.accountNameEnglish;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.accountNumber.length * 3;
  {
    final value = object.description;
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

void _accountSerialize(
  Account object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountCategoryKind.name);
  writer.writeString(offsets[1], object.accountName);
  writer.writeString(offsets[2], object.accountNameEnglish);
  writer.writeString(offsets[3], object.accountNumber);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.description);
  writer.writeBool(offsets[6], object.detailByAccountObject);
  writer.writeBool(offsets[7], object.detailByBankAccount);
  writer.writeBool(offsets[8], object.detailByContract);
  writer.writeBool(offsets[9], object.detailByDepartment);
  writer.writeBool(offsets[10], object.detailByExpenseItem);
  writer.writeBool(offsets[11], object.detailByJob);
  writer.writeBool(offsets[12], object.detailByOrder);
  writer.writeBool(offsets[13], object.detailByProjectWork);
  writer.writeLong(offsets[14], object.grade);
  writer.writeBool(offsets[15], object.inactive);
  writer.writeBool(offsets[16], object.isParent);
  writer.writeDateTime(offsets[17], object.lastSyncAt);
  writer.writeBool(offsets[18], object.needsSync);
  writer.writeLong(offsets[19], object.parentId);
  writer.writeString(offsets[20], object.remoteId);
  writer.writeDateTime(offsets[21], object.updatedAt);
}

Account _accountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Account();
  object.accountCategoryKind = _AccountaccountCategoryKindValueEnumMap[
          reader.readStringOrNull(offsets[0])] ??
      AccountCategoryKind.balanceSheet;
  object.accountName = reader.readString(offsets[1]);
  object.accountNameEnglish = reader.readStringOrNull(offsets[2]);
  object.accountNumber = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.detailByAccountObject = reader.readBool(offsets[6]);
  object.detailByBankAccount = reader.readBool(offsets[7]);
  object.detailByContract = reader.readBool(offsets[8]);
  object.detailByDepartment = reader.readBool(offsets[9]);
  object.detailByExpenseItem = reader.readBool(offsets[10]);
  object.detailByJob = reader.readBool(offsets[11]);
  object.detailByOrder = reader.readBool(offsets[12]);
  object.detailByProjectWork = reader.readBool(offsets[13]);
  object.grade = reader.readLong(offsets[14]);
  object.id = id;
  object.inactive = reader.readBool(offsets[15]);
  object.isParent = reader.readBool(offsets[16]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[17]);
  object.needsSync = reader.readBool(offsets[18]);
  object.parentId = reader.readLongOrNull(offsets[19]);
  object.remoteId = reader.readStringOrNull(offsets[20]);
  object.updatedAt = reader.readDateTime(offsets[21]);
  return object;
}

P _accountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_AccountaccountCategoryKindValueEnumMap[
              reader.readStringOrNull(offset)] ??
          AccountCategoryKind.balanceSheet) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AccountaccountCategoryKindEnumValueMap = {
  r'balanceSheet': r'balanceSheet',
  r'offBalanceSheet': r'offBalanceSheet',
};
const _AccountaccountCategoryKindValueEnumMap = {
  r'balanceSheet': AccountCategoryKind.balanceSheet,
  r'offBalanceSheet': AccountCategoryKind.offBalanceSheet,
};

Id _accountGetId(Account object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _accountGetLinks(Account object) {
  return [];
}

void _accountAttach(IsarCollection<dynamic> col, Id id, Account object) {
  object.id = id;
}

extension AccountByIndex on IsarCollection<Account> {
  Future<Account?> getByAccountNumber(String accountNumber) {
    return getByIndex(r'accountNumber', [accountNumber]);
  }

  Account? getByAccountNumberSync(String accountNumber) {
    return getByIndexSync(r'accountNumber', [accountNumber]);
  }

  Future<bool> deleteByAccountNumber(String accountNumber) {
    return deleteByIndex(r'accountNumber', [accountNumber]);
  }

  bool deleteByAccountNumberSync(String accountNumber) {
    return deleteByIndexSync(r'accountNumber', [accountNumber]);
  }

  Future<List<Account?>> getAllByAccountNumber(
      List<String> accountNumberValues) {
    final values = accountNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'accountNumber', values);
  }

  List<Account?> getAllByAccountNumberSync(List<String> accountNumberValues) {
    final values = accountNumberValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'accountNumber', values);
  }

  Future<int> deleteAllByAccountNumber(List<String> accountNumberValues) {
    final values = accountNumberValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'accountNumber', values);
  }

  int deleteAllByAccountNumberSync(List<String> accountNumberValues) {
    final values = accountNumberValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'accountNumber', values);
  }

  Future<Id> putByAccountNumber(Account object) {
    return putByIndex(r'accountNumber', object);
  }

  Id putByAccountNumberSync(Account object, {bool saveLinks = true}) {
    return putByIndexSync(r'accountNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAccountNumber(List<Account> objects) {
    return putAllByIndex(r'accountNumber', objects);
  }

  List<Id> putAllByAccountNumberSync(List<Account> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'accountNumber', objects, saveLinks: saveLinks);
  }
}

extension AccountQueryWhereSort on QueryBuilder<Account, Account, QWhere> {
  QueryBuilder<Account, Account, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AccountQueryWhere on QueryBuilder<Account, Account, QWhereClause> {
  QueryBuilder<Account, Account, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Account, Account, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Account, Account, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Account, Account, QAfterWhereClause> idBetween(
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

  QueryBuilder<Account, Account, QAfterWhereClause> accountNumberEqualTo(
      String accountNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'accountNumber',
        value: [accountNumber],
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterWhereClause> accountNumberNotEqualTo(
      String accountNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNumber',
              lower: [],
              upper: [accountNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNumber',
              lower: [accountNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNumber',
              lower: [accountNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'accountNumber',
              lower: [],
              upper: [accountNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AccountQueryFilter
    on QueryBuilder<Account, Account, QFilterCondition> {
  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindEqualTo(
    AccountCategoryKind value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindGreaterThan(
    AccountCategoryKind value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindLessThan(
    AccountCategoryKind value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindBetween(
    AccountCategoryKind lower,
    AccountCategoryKind upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountCategoryKind',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountCategoryKind',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountCategoryKind',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountCategoryKindIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountCategoryKind',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountNameEnglish',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountNameEnglish',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountNameEnglish',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNameEnglish',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNameEnglish',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNameEnglishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNameEnglish',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> accountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      accountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionLessThan(
    String? value, {
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      detailByAccountObjectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByAccountObject',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      detailByBankAccountEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByBankAccount',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> detailByContractEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByContract',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      detailByDepartmentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByDepartment',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      detailByExpenseItemEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByExpenseItem',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> detailByJobEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByJob',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> detailByOrderEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition>
      detailByProjectWorkEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByProjectWork',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> gradeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> gradeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> gradeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> gradeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> inactiveEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inactive',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> isParentEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isParent',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> lastSyncAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> needsSyncEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> parentIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> parentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> parentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> parentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdContains(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdMatches(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Account, Account, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<Account, Account, QAfterFilterCondition> updatedAtBetween(
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

extension AccountQueryObject
    on QueryBuilder<Account, Account, QFilterCondition> {}

extension AccountQueryLinks
    on QueryBuilder<Account, Account, QFilterCondition> {}

extension AccountQuerySortBy on QueryBuilder<Account, Account, QSortBy> {
  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountCategoryKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountCategoryKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountNameEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountNameEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByAccountObject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy>
      sortByDetailByAccountObjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByBankAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByContract() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByContract', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByContractDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByContract', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByDepartment', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByDepartment', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByExpenseItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByExpenseItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByJobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByOrder', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByOrder', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByProjectWork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByProjectWork', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByDetailByProjectWorkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByProjectWork', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByIsParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByIsParentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AccountQuerySortThenBy
    on QueryBuilder<Account, Account, QSortThenBy> {
  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountCategoryKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountCategoryKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountNameEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountNameEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByAccountObject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy>
      thenByDetailByAccountObjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByBankAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByContract() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByContract', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByContractDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByContract', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByDepartment', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByDepartmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByDepartment', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByExpenseItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByExpenseItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByJobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByOrder', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByOrder', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByProjectWork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByProjectWork', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByDetailByProjectWorkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByProjectWork', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByIsParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByIsParentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Account, Account, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AccountQueryWhereDistinct
    on QueryBuilder<Account, Account, QDistinct> {
  QueryBuilder<Account, Account, QDistinct> distinctByAccountCategoryKind(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountCategoryKind',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByAccountName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByAccountNameEnglish(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNameEnglish',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByAccountNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByAccountObject() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByAccountObject');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByBankAccount');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByContract() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByContract');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByDepartment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByDepartment');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByExpenseItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByExpenseItem');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByJob');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByOrder');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByDetailByProjectWork() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByProjectWork');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inactive');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByIsParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isParent');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId');
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Account, Account, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension AccountQueryProperty
    on QueryBuilder<Account, Account, QQueryProperty> {
  QueryBuilder<Account, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Account, AccountCategoryKind, QQueryOperations>
      accountCategoryKindProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountCategoryKind');
    });
  }

  QueryBuilder<Account, String, QQueryOperations> accountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountName');
    });
  }

  QueryBuilder<Account, String?, QQueryOperations>
      accountNameEnglishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNameEnglish');
    });
  }

  QueryBuilder<Account, String, QQueryOperations> accountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNumber');
    });
  }

  QueryBuilder<Account, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Account, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations>
      detailByAccountObjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByAccountObject');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByBankAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByBankAccount');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByContractProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByContract');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByDepartmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByDepartment');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByExpenseItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByExpenseItem');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByJobProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByJob');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByOrder');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> detailByProjectWorkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByProjectWork');
    });
  }

  QueryBuilder<Account, int, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> inactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inactive');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> isParentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isParent');
    });
  }

  QueryBuilder<Account, DateTime?, QQueryOperations> lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<Account, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<Account, int?, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<Account, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<Account, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
