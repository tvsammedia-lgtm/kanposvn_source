// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_default.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccountDefaultCollection on Isar {
  IsarCollection<AccountDefault> get accountDefaults => this.collection();
}

const AccountDefaultSchema = CollectionSchema(
  name: r'AccountDefault',
  id: -3969429669206172432,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'crossCreditAccount': PropertySchema(
      id: 1,
      name: r'crossCreditAccount',
      type: IsarType.string,
    ),
    r'crossDebitAccount': PropertySchema(
      id: 2,
      name: r'crossDebitAccount',
      type: IsarType.string,
    ),
    r'defaultCreditAccount': PropertySchema(
      id: 3,
      name: r'defaultCreditAccount',
      type: IsarType.string,
    ),
    r'defaultDebitAccount': PropertySchema(
      id: 4,
      name: r'defaultDebitAccount',
      type: IsarType.string,
    ),
    r'filterCondition': PropertySchema(
      id: 5,
      name: r'filterCondition',
      type: IsarType.string,
    ),
    r'inactive': PropertySchema(
      id: 6,
      name: r'inactive',
      type: IsarType.bool,
    ),
    r'lastSyncAt': PropertySchema(
      id: 7,
      name: r'lastSyncAt',
      type: IsarType.dateTime,
    ),
    r'needsSync': PropertySchema(
      id: 8,
      name: r'needsSync',
      type: IsarType.bool,
    ),
    r'refType': PropertySchema(
      id: 9,
      name: r'refType',
      type: IsarType.long,
    ),
    r'refTypeName': PropertySchema(
      id: 10,
      name: r'refTypeName',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 11,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'voucherType': PropertySchema(
      id: 13,
      name: r'voucherType',
      type: IsarType.string,
    )
  },
  estimateSize: _accountDefaultEstimateSize,
  serialize: _accountDefaultSerialize,
  deserialize: _accountDefaultDeserialize,
  deserializeProp: _accountDefaultDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _accountDefaultGetId,
  getLinks: _accountDefaultGetLinks,
  attach: _accountDefaultAttach,
  version: '3.1.0+1',
);

int _accountDefaultEstimateSize(
  AccountDefault object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.crossCreditAccount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.crossDebitAccount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.defaultCreditAccount.length * 3;
  bytesCount += 3 + object.defaultDebitAccount.length * 3;
  {
    final value = object.filterCondition;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.refTypeName.length * 3;
  {
    final value = object.remoteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.voucherType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _accountDefaultSerialize(
  AccountDefault object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.crossCreditAccount);
  writer.writeString(offsets[2], object.crossDebitAccount);
  writer.writeString(offsets[3], object.defaultCreditAccount);
  writer.writeString(offsets[4], object.defaultDebitAccount);
  writer.writeString(offsets[5], object.filterCondition);
  writer.writeBool(offsets[6], object.inactive);
  writer.writeDateTime(offsets[7], object.lastSyncAt);
  writer.writeBool(offsets[8], object.needsSync);
  writer.writeLong(offsets[9], object.refType);
  writer.writeString(offsets[10], object.refTypeName);
  writer.writeString(offsets[11], object.remoteId);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.voucherType);
}

AccountDefault _accountDefaultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AccountDefault();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.crossCreditAccount = reader.readStringOrNull(offsets[1]);
  object.crossDebitAccount = reader.readStringOrNull(offsets[2]);
  object.defaultCreditAccount = reader.readString(offsets[3]);
  object.defaultDebitAccount = reader.readString(offsets[4]);
  object.filterCondition = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.inactive = reader.readBool(offsets[6]);
  object.lastSyncAt = reader.readDateTimeOrNull(offsets[7]);
  object.needsSync = reader.readBool(offsets[8]);
  object.refType = reader.readLong(offsets[9]);
  object.refTypeName = reader.readString(offsets[10]);
  object.remoteId = reader.readStringOrNull(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.voucherType = reader.readStringOrNull(offsets[13]);
  return object;
}

P _accountDefaultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accountDefaultGetId(AccountDefault object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _accountDefaultGetLinks(AccountDefault object) {
  return [];
}

void _accountDefaultAttach(
    IsarCollection<dynamic> col, Id id, AccountDefault object) {
  object.id = id;
}

extension AccountDefaultQueryWhereSort
    on QueryBuilder<AccountDefault, AccountDefault, QWhere> {
  QueryBuilder<AccountDefault, AccountDefault, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AccountDefaultQueryWhere
    on QueryBuilder<AccountDefault, AccountDefault, QWhereClause> {
  QueryBuilder<AccountDefault, AccountDefault, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterWhereClause> idBetween(
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

extension AccountDefaultQueryFilter
    on QueryBuilder<AccountDefault, AccountDefault, QFilterCondition> {
  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crossCreditAccount',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crossCreditAccount',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'crossCreditAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'crossCreditAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossCreditAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'crossCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crossDebitAccount',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crossDebitAccount',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'crossDebitAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'crossDebitAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      crossDebitAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'crossDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultCreditAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultCreditAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultCreditAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultDebitAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultDebitAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      defaultDebitAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filterCondition',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filterCondition',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filterCondition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filterCondition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      filterConditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filterCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      inactiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inactive',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refType',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refType',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refType',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refTypeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      refTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
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

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherType',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherType',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voucherType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voucherType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherType',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterFilterCondition>
      voucherTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voucherType',
        value: '',
      ));
    });
  }
}

extension AccountDefaultQueryObject
    on QueryBuilder<AccountDefault, AccountDefault, QFilterCondition> {}

extension AccountDefaultQueryLinks
    on QueryBuilder<AccountDefault, AccountDefault, QFilterCondition> {}

extension AccountDefaultQuerySortBy
    on QueryBuilder<AccountDefault, AccountDefault, QSortBy> {
  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByCrossCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByCrossCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByCrossDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByCrossDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByDefaultCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByDefaultCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByDefaultDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByDefaultDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByFilterCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByFilterConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> sortByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> sortByRefType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByRefTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByRefTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByRefTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByVoucherType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      sortByVoucherTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.desc);
    });
  }
}

extension AccountDefaultQuerySortThenBy
    on QueryBuilder<AccountDefault, AccountDefault, QSortThenBy> {
  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByCrossCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByCrossCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByCrossDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByCrossDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByDefaultCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByDefaultCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByDefaultDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByDefaultDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByFilterCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByFilterConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByRefType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByRefTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByRefTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByRefTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByVoucherType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.asc);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QAfterSortBy>
      thenByVoucherTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.desc);
    });
  }
}

extension AccountDefaultQueryWhereDistinct
    on QueryBuilder<AccountDefault, AccountDefault, QDistinct> {
  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByCrossCreditAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'crossCreditAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByCrossDebitAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'crossDebitAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByDefaultCreditAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultCreditAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByDefaultDebitAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultDebitAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByFilterCondition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterCondition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct> distinctByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inactive');
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct> distinctByRefType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refType');
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct> distinctByRefTypeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refTypeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct> distinctByRemoteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<AccountDefault, AccountDefault, QDistinct> distinctByVoucherType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherType', caseSensitive: caseSensitive);
    });
  }
}

extension AccountDefaultQueryProperty
    on QueryBuilder<AccountDefault, AccountDefault, QQueryProperty> {
  QueryBuilder<AccountDefault, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AccountDefault, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AccountDefault, String?, QQueryOperations>
      crossCreditAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crossCreditAccount');
    });
  }

  QueryBuilder<AccountDefault, String?, QQueryOperations>
      crossDebitAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crossDebitAccount');
    });
  }

  QueryBuilder<AccountDefault, String, QQueryOperations>
      defaultCreditAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultCreditAccount');
    });
  }

  QueryBuilder<AccountDefault, String, QQueryOperations>
      defaultDebitAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultDebitAccount');
    });
  }

  QueryBuilder<AccountDefault, String?, QQueryOperations>
      filterConditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterCondition');
    });
  }

  QueryBuilder<AccountDefault, bool, QQueryOperations> inactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inactive');
    });
  }

  QueryBuilder<AccountDefault, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<AccountDefault, bool, QQueryOperations> needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<AccountDefault, int, QQueryOperations> refTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refType');
    });
  }

  QueryBuilder<AccountDefault, String, QQueryOperations> refTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refTypeName');
    });
  }

  QueryBuilder<AccountDefault, String?, QQueryOperations> remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<AccountDefault, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<AccountDefault, String?, QQueryOperations>
      voucherTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherType');
    });
  }
}
