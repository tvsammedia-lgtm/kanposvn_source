// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTramXangAccountCollection on Isar {
  IsarCollection<TramXangAccount> get tramXangAccounts => this.collection();
}

const TramXangAccountSchema = CollectionSchema(
  name: r'TramXangAccount',
  id: -2189814028542273923,
  properties: {
    r'accountCategoryKind': PropertySchema(
      id: 0,
      name: r'accountCategoryKind',
      type: IsarType.string,
      enumMap: _TramXangAccountaccountCategoryKindEnumValueMap,
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
    r'detailByExpenseItem': PropertySchema(
      id: 8,
      name: r'detailByExpenseItem',
      type: IsarType.bool,
    ),
    r'detailByJob': PropertySchema(
      id: 9,
      name: r'detailByJob',
      type: IsarType.bool,
    ),
    r'grade': PropertySchema(
      id: 10,
      name: r'grade',
      type: IsarType.long,
    ),
    r'inactive': PropertySchema(
      id: 11,
      name: r'inactive',
      type: IsarType.bool,
    ),
    r'isParent': PropertySchema(
      id: 12,
      name: r'isParent',
      type: IsarType.bool,
    ),
    r'lastSyncAt': PropertySchema(
      id: 13,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'needsSync': PropertySchema(
      id: 14,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'parentId': PropertySchema(
      id: 15,
      name: r'parentId',
      type: IsarType.long,
    ),
    r'remoteId': PropertySchema(
      id: 16,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _tramXangAccountEstimateSize,
  serialize: _tramXangAccountSerialize,
  deserialize: _tramXangAccountDeserialize,
  deserializeProp: _tramXangAccountDeserializeProp,
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
  getId: _tramXangAccountGetId,
  getLinks: _tramXangAccountGetLinks,
  attach: _tramXangAccountAttach,
  version: '3.1.0+1',
);

int _tramXangAccountEstimateSize(
  TramXangAccount object,
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

void _tramXangAccountSerialize(
  TramXangAccount object,
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
  writer.writeBool(offsets[8], object.detailByExpenseItem);
  writer.writeBool(offsets[9], object.detailByJob);
  writer.writeLong(offsets[10], object.grade);
  writer.writeBool(offsets[11], object.inactive);
  writer.writeBool(offsets[12], object.isParent);
  writer.writeDateTime(offsets[13], object.lastSyncAt);
  writer.writeBool(offsets[14], object.needsSync);
  writer.writeLong(offsets[15], object.parentId);
  writer.writeString(offsets[16], object.remoteId);
  writer.writeDateTime(offsets[17], object.updatedAt);
}

TramXangAccount _tramXangAccountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TramXangAccount();
  object.accountCategoryKind = _TramXangAccountaccountCategoryKindValueEnumMap[
          reader.readStringOrNull(offsets[0])] ??
      TramXangAccountCategoryKind.balanceSheet;
  object.accountName = reader.readString(offsets[1]);
  object.accountNameEnglish = reader.readStringOrNull(offsets[2]);
  object.accountNumber = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.description = reader.readStringOrNull(offsets[5]);
  object.detailByAccountObject = reader.readBool(offsets[6]);
  object.detailByBankAccount = reader.readBool(offsets[7]);
  object.detailByExpenseItem = reader.readBool(offsets[8]);
  object.detailByJob = reader.readBool(offsets[9]);
  object.grade = reader.readLong(offsets[10]);
  object.id = id;
  object.inactive = reader.readBool(offsets[11]);
  object.isParent = reader.readBool(offsets[12]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[13]);
  object.needsSync = reader.readBool(offsets[14]);
  object.parentId = reader.readLongOrNull(offsets[15]);
  object.remoteId = reader.readStringOrNull(offsets[16]);
  object.updatedAt = reader.readDateTime(offsets[17]);
  return object;
}

P _tramXangAccountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_TramXangAccountaccountCategoryKindValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TramXangAccountCategoryKind.balanceSheet) as P;
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
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TramXangAccountaccountCategoryKindEnumValueMap = {
  r'balanceSheet': r'balanceSheet',
  r'offBalanceSheet': r'offBalanceSheet',
};
const _TramXangAccountaccountCategoryKindValueEnumMap = {
  r'balanceSheet': TramXangAccountCategoryKind.balanceSheet,
  r'offBalanceSheet': TramXangAccountCategoryKind.offBalanceSheet,
};

Id _tramXangAccountGetId(TramXangAccount object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tramXangAccountGetLinks(TramXangAccount object) {
  return [];
}

void _tramXangAccountAttach(
    IsarCollection<dynamic> col, Id id, TramXangAccount object) {
  object.id = id;
}

extension TramXangAccountByIndex on IsarCollection<TramXangAccount> {
  Future<TramXangAccount?> getByAccountNumber(String accountNumber) {
    return getByIndex(r'accountNumber', [accountNumber]);
  }

  TramXangAccount? getByAccountNumberSync(String accountNumber) {
    return getByIndexSync(r'accountNumber', [accountNumber]);
  }

  Future<bool> deleteByAccountNumber(String accountNumber) {
    return deleteByIndex(r'accountNumber', [accountNumber]);
  }

  bool deleteByAccountNumberSync(String accountNumber) {
    return deleteByIndexSync(r'accountNumber', [accountNumber]);
  }

  Future<List<TramXangAccount?>> getAllByAccountNumber(
      List<String> accountNumberValues) {
    final values = accountNumberValues.map((e) => [e]).toList();
    return getAllByIndex(r'accountNumber', values);
  }

  List<TramXangAccount?> getAllByAccountNumberSync(
      List<String> accountNumberValues) {
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

  Future<Id> putByAccountNumber(TramXangAccount object) {
    return putByIndex(r'accountNumber', object);
  }

  Id putByAccountNumberSync(TramXangAccount object, {bool saveLinks = true}) {
    return putByIndexSync(r'accountNumber', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAccountNumber(List<TramXangAccount> objects) {
    return putAllByIndex(r'accountNumber', objects);
  }

  List<Id> putAllByAccountNumberSync(List<TramXangAccount> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'accountNumber', objects, saveLinks: saveLinks);
  }
}

extension TramXangAccountQueryWhereSort
    on QueryBuilder<TramXangAccount, TramXangAccount, QWhere> {
  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TramXangAccountQueryWhere
    on QueryBuilder<TramXangAccount, TramXangAccount, QWhereClause> {
  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause> idBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause>
      accountNumberEqualTo(String accountNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'accountNumber',
        value: [accountNumber],
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterWhereClause>
      accountNumberNotEqualTo(String accountNumber) {
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

extension TramXangAccountQueryFilter
    on QueryBuilder<TramXangAccount, TramXangAccount, QFilterCondition> {
  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindEqualTo(
    TramXangAccountCategoryKind value, {
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindGreaterThan(
    TramXangAccountCategoryKind value, {
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindLessThan(
    TramXangAccountCategoryKind value, {
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindBetween(
    TramXangAccountCategoryKind lower,
    TramXangAccountCategoryKind upper, {
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountCategoryKind',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountCategoryKind',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountCategoryKind',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountCategoryKindIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountCategoryKind',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEqualTo(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameGreaterThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameLessThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameStartsWith(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEndsWith(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountName',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEnglishIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountNameEnglish',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEnglishIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountNameEnglish',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEnglishContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNameEnglish',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEnglishMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNameEnglish',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEnglishIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNameEnglish',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNameEnglishIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNameEnglish',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberEqualTo(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberLessThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberStartsWith(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberEndsWith(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      accountNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      detailByAccountObjectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByAccountObject',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      detailByBankAccountEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByBankAccount',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      detailByExpenseItemEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByExpenseItem',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      detailByJobEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailByJob',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      gradeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      gradeGreaterThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      gradeLessThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      gradeBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      inactiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inactive',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      isParentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isParent',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      lastSyncAtBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      parentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      parentIdGreaterThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      parentIdLessThan(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      parentIdBetween(
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterFilterCondition>
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
}

extension TramXangAccountQueryObject
    on QueryBuilder<TramXangAccount, TramXangAccount, QFilterCondition> {}

extension TramXangAccountQueryLinks
    on QueryBuilder<TramXangAccount, TramXangAccount, QFilterCondition> {}

extension TramXangAccountQuerySortBy
    on QueryBuilder<TramXangAccount, TramXangAccount, QSortBy> {
  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountCategoryKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountCategoryKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountNameEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountNameEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByAccountObject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByAccountObjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByBankAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByExpenseItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByExpenseItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByDetailByJobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByIsParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByIsParentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TramXangAccountQuerySortThenBy
    on QueryBuilder<TramXangAccount, TramXangAccount, QSortThenBy> {
  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountCategoryKind() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountCategoryKindDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountCategoryKind', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountName', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountNameEnglish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountNameEnglishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNameEnglish', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByAccountNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountNumber', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByAccountObject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByAccountObjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByAccountObject', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByBankAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByBankAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByExpenseItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByExpenseItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByExpenseItem', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByDetailByJobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detailByJob', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByIsParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByIsParentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParent', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TramXangAccountQueryWhereDistinct
    on QueryBuilder<TramXangAccount, TramXangAccount, QDistinct> {
  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByAccountCategoryKind({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountCategoryKind',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByAccountName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByAccountNameEnglish({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNameEnglish',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByAccountNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByDetailByAccountObject() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByAccountObject');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByDetailByBankAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByBankAccount');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByDetailByExpenseItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByExpenseItem');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByDetailByJob() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detailByJob');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct> distinctByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inactive');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByIsParent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isParent');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccount, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension TramXangAccountQueryProperty
    on QueryBuilder<TramXangAccount, TramXangAccount, QQueryProperty> {
  QueryBuilder<TramXangAccount, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TramXangAccount, TramXangAccountCategoryKind, QQueryOperations>
      accountCategoryKindProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountCategoryKind');
    });
  }

  QueryBuilder<TramXangAccount, String, QQueryOperations>
      accountNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountName');
    });
  }

  QueryBuilder<TramXangAccount, String?, QQueryOperations>
      accountNameEnglishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNameEnglish');
    });
  }

  QueryBuilder<TramXangAccount, String, QQueryOperations>
      accountNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountNumber');
    });
  }

  QueryBuilder<TramXangAccount, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TramXangAccount, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations>
      detailByAccountObjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByAccountObject');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations>
      detailByBankAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByBankAccount');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations>
      detailByExpenseItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByExpenseItem');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations> detailByJobProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detailByJob');
    });
  }

  QueryBuilder<TramXangAccount, int, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations> inactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inactive');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations> isParentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isParent');
    });
  }

  QueryBuilder<TramXangAccount, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<TramXangAccount, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<TramXangAccount, int?, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<TramXangAccount, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<TramXangAccount, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
