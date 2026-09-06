// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_default.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTramXangAccountDefaultCollection on Isar {
  IsarCollection<TramXangAccountDefault> get tramXangAccountDefaults =>
      this.collection();
}

const TramXangAccountDefaultSchema = CollectionSchema(
  name: r'TramXangAccountDefault',
  id: -8713323583814245299,
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
  estimateSize: _tramXangAccountDefaultEstimateSize,
  serialize: _tramXangAccountDefaultSerialize,
  deserialize: _tramXangAccountDefaultDeserialize,
  deserializeProp: _tramXangAccountDefaultDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tramXangAccountDefaultGetId,
  getLinks: _tramXangAccountDefaultGetLinks,
  attach: _tramXangAccountDefaultAttach,
  version: '3.1.0+1',
);

int _tramXangAccountDefaultEstimateSize(
  TramXangAccountDefault object,
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

void _tramXangAccountDefaultSerialize(
  TramXangAccountDefault object,
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

TramXangAccountDefault _tramXangAccountDefaultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TramXangAccountDefault();
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

P _tramXangAccountDefaultDeserializeProp<P>(
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

Id _tramXangAccountDefaultGetId(TramXangAccountDefault object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tramXangAccountDefaultGetLinks(
    TramXangAccountDefault object) {
  return [];
}

void _tramXangAccountDefaultAttach(
    IsarCollection<dynamic> col, Id id, TramXangAccountDefault object) {
  object.id = id;
}

extension TramXangAccountDefaultQueryWhereSort
    on QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QWhere> {
  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TramXangAccountDefaultQueryWhere on QueryBuilder<
    TramXangAccountDefault, TramXangAccountDefault, QWhereClause> {
  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterWhereClause> idBetween(
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

extension TramXangAccountDefaultQueryFilter on QueryBuilder<
    TramXangAccountDefault, TramXangAccountDefault, QFilterCondition> {
  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crossCreditAccount',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crossCreditAccount',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      crossCreditAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'crossCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      crossCreditAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'crossCreditAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossCreditAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'crossCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'crossDebitAccount',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'crossDebitAccount',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      crossDebitAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'crossDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      crossDebitAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'crossDebitAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'crossDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> crossDebitAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'crossDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      defaultCreditAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultCreditAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      defaultCreditAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultCreditAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultCreditAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultCreditAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      defaultDebitAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'defaultDebitAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      defaultDebitAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'defaultDebitAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> defaultDebitAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'defaultDebitAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'filterCondition',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'filterCondition',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      filterConditionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'filterCondition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      filterConditionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'filterCondition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filterCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> filterConditionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'filterCondition',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> inactiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inactive',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> lastSyncAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> lastSyncAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSyncAt',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> lastSyncAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> lastSyncAtGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> lastSyncAtLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> lastSyncAtBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> needsSyncEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needsSync',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refType',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      refTypeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'refTypeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      refTypeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'refTypeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> refTypeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'refTypeName',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteId',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voucherType',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voucherType',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeEqualTo(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeGreaterThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeLessThan(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeBetween(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeStartsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeEndsWith(
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

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      voucherTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'voucherType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
          QAfterFilterCondition>
      voucherTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'voucherType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voucherType',
        value: '',
      ));
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault,
      QAfterFilterCondition> voucherTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'voucherType',
        value: '',
      ));
    });
  }
}

extension TramXangAccountDefaultQueryObject on QueryBuilder<
    TramXangAccountDefault, TramXangAccountDefault, QFilterCondition> {}

extension TramXangAccountDefaultQueryLinks on QueryBuilder<
    TramXangAccountDefault, TramXangAccountDefault, QFilterCondition> {}

extension TramXangAccountDefaultQuerySortBy
    on QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QSortBy> {
  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByCrossCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByCrossCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByCrossDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByCrossDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByDefaultCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByDefaultCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByDefaultDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByDefaultDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByFilterCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByFilterConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByRefType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByRefTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByRefTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByRefTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByVoucherType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      sortByVoucherTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.desc);
    });
  }
}

extension TramXangAccountDefaultQuerySortThenBy on QueryBuilder<
    TramXangAccountDefault, TramXangAccountDefault, QSortThenBy> {
  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByCrossCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByCrossCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByCrossDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByCrossDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'crossDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByDefaultCreditAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByDefaultCreditAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultCreditAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByDefaultDebitAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByDefaultDebitAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultDebitAccount', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByFilterCondition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByFilterConditionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'filterCondition', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByInactiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inactive', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByLastSyncAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByNeedsSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needsSync', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByRefType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByRefTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refType', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByRefTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByRefTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refTypeName', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByVoucherType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.asc);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QAfterSortBy>
      thenByVoucherTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voucherType', Sort.desc);
    });
  }
}

extension TramXangAccountDefaultQueryWhereDistinct
    on QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct> {
  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByCrossCreditAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'crossCreditAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByCrossDebitAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'crossDebitAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByDefaultCreditAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultCreditAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByDefaultDebitAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultDebitAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByFilterCondition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filterCondition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByInactive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inactive');
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByLastSyncAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncAt');
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByNeedsSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needsSync');
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByRefType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refType');
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByRefTypeName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refTypeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TramXangAccountDefault, TramXangAccountDefault, QDistinct>
      distinctByVoucherType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voucherType', caseSensitive: caseSensitive);
    });
  }
}

extension TramXangAccountDefaultQueryProperty on QueryBuilder<
    TramXangAccountDefault, TramXangAccountDefault, QQueryProperty> {
  QueryBuilder<TramXangAccountDefault, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TramXangAccountDefault, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TramXangAccountDefault, String?, QQueryOperations>
      crossCreditAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crossCreditAccount');
    });
  }

  QueryBuilder<TramXangAccountDefault, String?, QQueryOperations>
      crossDebitAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'crossDebitAccount');
    });
  }

  QueryBuilder<TramXangAccountDefault, String, QQueryOperations>
      defaultCreditAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultCreditAccount');
    });
  }

  QueryBuilder<TramXangAccountDefault, String, QQueryOperations>
      defaultDebitAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultDebitAccount');
    });
  }

  QueryBuilder<TramXangAccountDefault, String?, QQueryOperations>
      filterConditionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterCondition');
    });
  }

  QueryBuilder<TramXangAccountDefault, bool, QQueryOperations>
      inactiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inactive');
    });
  }

  QueryBuilder<TramXangAccountDefault, DateTime?, QQueryOperations>
      lastSyncAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncAt');
    });
  }

  QueryBuilder<TramXangAccountDefault, bool, QQueryOperations>
      needsSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needsSync');
    });
  }

  QueryBuilder<TramXangAccountDefault, int, QQueryOperations>
      refTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refType');
    });
  }

  QueryBuilder<TramXangAccountDefault, String, QQueryOperations>
      refTypeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refTypeName');
    });
  }

  QueryBuilder<TramXangAccountDefault, String?, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<TramXangAccountDefault, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TramXangAccountDefault, String?, QQueryOperations>
      voucherTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voucherType');
    });
  }
}
