// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bida_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBidaPricingRuleCollection on Isar {
  IsarCollection<BidaPricingRule> get bidaPricingRules => this.collection();
}

const BidaPricingRuleSchema = CollectionSchema(
  name: r'BidaPricingRule',
  id: 6536568953506401668,
  properties: {
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 1,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'fromMinuteOfDay': PropertySchema(
      id: 2,
      name: r'fromMinuteOfDay',
      type: IsarType.long,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'pricePerHour': PropertySchema(
      id: 5,
      name: r'pricePerHour',
      type: IsarType.double,
    ),
    r'priority': PropertySchema(
      id: 6,
      name: r'priority',
      type: IsarType.long,
    ),
    r'ruleId': PropertySchema(
      id: 7,
      name: r'ruleId',
      type: IsarType.string,
    ),
    r'tableType': PropertySchema(
      id: 8,
      name: r'tableType',
      type: IsarType.byte,
      enumMap: _BidaPricingRuletableTypeEnumValueMap,
    ),
    r'toMinuteOfDay': PropertySchema(
      id: 9,
      name: r'toMinuteOfDay',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 11,
      name: r'version',
      type: IsarType.long,
    ),
    r'weekendOnly': PropertySchema(
      id: 12,
      name: r'weekendOnly',
      type: IsarType.bool,
    )
  },
  estimateSize: _bidaPricingRuleEstimateSize,
  serialize: _bidaPricingRuleSerialize,
  deserialize: _bidaPricingRuleDeserialize,
  deserializeProp: _bidaPricingRuleDeserializeProp,
  idName: r'id',
  indexes: {
    r'ruleId': IndexSchema(
      id: -7287016718321404572,
      name: r'ruleId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'ruleId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bidaPricingRuleGetId,
  getLinks: _bidaPricingRuleGetLinks,
  attach: _bidaPricingRuleAttach,
  version: '3.1.0+1',
);

int _bidaPricingRuleEstimateSize(
  BidaPricingRule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.ruleId.length * 3;
  return bytesCount;
}

void _bidaPricingRuleSerialize(
  BidaPricingRule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeLong(offsets[2], object.fromMinuteOfDay);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.name);
  writer.writeDouble(offsets[5], object.pricePerHour);
  writer.writeLong(offsets[6], object.priority);
  writer.writeString(offsets[7], object.ruleId);
  writer.writeByte(offsets[8], object.tableType.index);
  writer.writeLong(offsets[9], object.toMinuteOfDay);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.version);
  writer.writeBool(offsets[12], object.weekendOnly);
}

BidaPricingRule _bidaPricingRuleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaPricingRule();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.fromMinuteOfDay = reader.readLong(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.pricePerHour = reader.readDouble(offsets[5]);
  object.priority = reader.readLong(offsets[6]);
  object.ruleId = reader.readString(offsets[7]);
  object.tableType = _BidaPricingRuletableTypeValueEnumMap[
          reader.readByteOrNull(offsets[8])] ??
      BidaTableType.LO;
  object.toMinuteOfDay = reader.readLong(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.version = reader.readLong(offsets[11]);
  object.weekendOnly = reader.readBool(offsets[12]);
  return object;
}

P _bidaPricingRuleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_BidaPricingRuletableTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BidaTableType.LO) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BidaPricingRuletableTypeEnumValueMap = {
  'LO': 0,
  'LIBRE': 1,
  'BANG_3': 2,
};
const _BidaPricingRuletableTypeValueEnumMap = {
  0: BidaTableType.LO,
  1: BidaTableType.LIBRE,
  2: BidaTableType.BANG_3,
};

Id _bidaPricingRuleGetId(BidaPricingRule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bidaPricingRuleGetLinks(BidaPricingRule object) {
  return [];
}

void _bidaPricingRuleAttach(
    IsarCollection<dynamic> col, Id id, BidaPricingRule object) {
  object.id = id;
}

extension BidaPricingRuleByIndex on IsarCollection<BidaPricingRule> {
  Future<BidaPricingRule?> getByRuleId(String ruleId) {
    return getByIndex(r'ruleId', [ruleId]);
  }

  BidaPricingRule? getByRuleIdSync(String ruleId) {
    return getByIndexSync(r'ruleId', [ruleId]);
  }

  Future<bool> deleteByRuleId(String ruleId) {
    return deleteByIndex(r'ruleId', [ruleId]);
  }

  bool deleteByRuleIdSync(String ruleId) {
    return deleteByIndexSync(r'ruleId', [ruleId]);
  }

  Future<List<BidaPricingRule?>> getAllByRuleId(List<String> ruleIdValues) {
    final values = ruleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ruleId', values);
  }

  List<BidaPricingRule?> getAllByRuleIdSync(List<String> ruleIdValues) {
    final values = ruleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'ruleId', values);
  }

  Future<int> deleteAllByRuleId(List<String> ruleIdValues) {
    final values = ruleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'ruleId', values);
  }

  int deleteAllByRuleIdSync(List<String> ruleIdValues) {
    final values = ruleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'ruleId', values);
  }

  Future<Id> putByRuleId(BidaPricingRule object) {
    return putByIndex(r'ruleId', object);
  }

  Id putByRuleIdSync(BidaPricingRule object, {bool saveLinks = true}) {
    return putByIndexSync(r'ruleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRuleId(List<BidaPricingRule> objects) {
    return putAllByIndex(r'ruleId', objects);
  }

  List<Id> putAllByRuleIdSync(List<BidaPricingRule> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ruleId', objects, saveLinks: saveLinks);
  }
}

extension BidaPricingRuleQueryWhereSort
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QWhere> {
  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BidaPricingRuleQueryWhere
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QWhereClause> {
  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause> idBetween(
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause>
      ruleIdEqualTo(String ruleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ruleId',
        value: [ruleId],
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterWhereClause>
      ruleIdNotEqualTo(String ruleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ruleId',
              lower: [],
              upper: [ruleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ruleId',
              lower: [ruleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ruleId',
              lower: [ruleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ruleId',
              lower: [],
              upper: [ruleId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BidaPricingRuleQueryFilter
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QFilterCondition> {
  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      fromMinuteOfDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromMinuteOfDay',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      fromMinuteOfDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromMinuteOfDay',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      fromMinuteOfDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromMinuteOfDay',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      fromMinuteOfDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromMinuteOfDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      pricePerHourEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      pricePerHourGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      pricePerHourLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      pricePerHourBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      priorityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      priorityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      ruleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      tableTypeEqualTo(BidaTableType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableType',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      tableTypeGreaterThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableType',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      tableTypeLessThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableType',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      tableTypeBetween(
    BidaTableType lower,
    BidaTableType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      toMinuteOfDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toMinuteOfDay',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      toMinuteOfDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toMinuteOfDay',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      toMinuteOfDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toMinuteOfDay',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      toMinuteOfDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toMinuteOfDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
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

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterFilterCondition>
      weekendOnlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekendOnly',
        value: value,
      ));
    });
  }
}

extension BidaPricingRuleQueryObject
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QFilterCondition> {}

extension BidaPricingRuleQueryLinks
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QFilterCondition> {}

extension BidaPricingRuleQuerySortBy
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QSortBy> {
  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByFromMinuteOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMinuteOfDay', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByFromMinuteOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMinuteOfDay', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByPricePerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByPricePerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> sortByRuleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByRuleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByTableType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByTableTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByToMinuteOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toMinuteOfDay', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByToMinuteOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toMinuteOfDay', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByWeekendOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekendOnly', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      sortByWeekendOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekendOnly', Sort.desc);
    });
  }
}

extension BidaPricingRuleQuerySortThenBy
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QSortThenBy> {
  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByFromMinuteOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMinuteOfDay', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByFromMinuteOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromMinuteOfDay', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByPricePerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByPricePerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> thenByRuleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByRuleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByTableType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByTableTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByToMinuteOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toMinuteOfDay', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByToMinuteOfDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toMinuteOfDay', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByWeekendOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekendOnly', Sort.asc);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QAfterSortBy>
      thenByWeekendOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekendOnly', Sort.desc);
    });
  }
}

extension BidaPricingRuleQueryWhereDistinct
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct> {
  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByFromMinuteOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromMinuteOfDay');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByPricePerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerHour');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct> distinctByRuleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByTableType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableType');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByToMinuteOfDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toMinuteOfDay');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<BidaPricingRule, BidaPricingRule, QDistinct>
      distinctByWeekendOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekendOnly');
    });
  }
}

extension BidaPricingRuleQueryProperty
    on QueryBuilder<BidaPricingRule, BidaPricingRule, QQueryProperty> {
  QueryBuilder<BidaPricingRule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BidaPricingRule, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<BidaPricingRule, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<BidaPricingRule, int, QQueryOperations>
      fromMinuteOfDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromMinuteOfDay');
    });
  }

  QueryBuilder<BidaPricingRule, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<BidaPricingRule, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BidaPricingRule, double, QQueryOperations>
      pricePerHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerHour');
    });
  }

  QueryBuilder<BidaPricingRule, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<BidaPricingRule, String, QQueryOperations> ruleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleId');
    });
  }

  QueryBuilder<BidaPricingRule, BidaTableType, QQueryOperations>
      tableTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableType');
    });
  }

  QueryBuilder<BidaPricingRule, int, QQueryOperations> toMinuteOfDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toMinuteOfDay');
    });
  }

  QueryBuilder<BidaPricingRule, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BidaPricingRule, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<BidaPricingRule, bool, QQueryOperations> weekendOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekendOnly');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBidaBlockPlanCollection on Isar {
  IsarCollection<BidaBlockPlan> get bidaBlockPlans => this.collection();
}

const BidaBlockPlanSchema = CollectionSchema(
  name: r'BidaBlockPlan',
  id: -128615689120959205,
  properties: {
    r'blockHours': PropertySchema(
      id: 0,
      name: r'blockHours',
      type: IsarType.double,
    ),
    r'blockPrice': PropertySchema(
      id: 1,
      name: r'blockPrice',
      type: IsarType.double,
    ),
    r'deletedAt': PropertySchema(
      id: 2,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 3,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'extraHourPrice': PropertySchema(
      id: 4,
      name: r'extraHourPrice',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'planId': PropertySchema(
      id: 7,
      name: r'planId',
      type: IsarType.string,
    ),
    r'tableType': PropertySchema(
      id: 8,
      name: r'tableType',
      type: IsarType.byte,
      enumMap: _BidaBlockPlantableTypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 10,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _bidaBlockPlanEstimateSize,
  serialize: _bidaBlockPlanSerialize,
  deserialize: _bidaBlockPlanDeserialize,
  deserializeProp: _bidaBlockPlanDeserializeProp,
  idName: r'id',
  indexes: {
    r'planId': IndexSchema(
      id: 7282644713036731817,
      name: r'planId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'planId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bidaBlockPlanGetId,
  getLinks: _bidaBlockPlanGetLinks,
  attach: _bidaBlockPlanAttach,
  version: '3.1.0+1',
);

int _bidaBlockPlanEstimateSize(
  BidaBlockPlan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.planId.length * 3;
  return bytesCount;
}

void _bidaBlockPlanSerialize(
  BidaBlockPlan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.blockHours);
  writer.writeDouble(offsets[1], object.blockPrice);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeDouble(offsets[4], object.extraHourPrice);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.name);
  writer.writeString(offsets[7], object.planId);
  writer.writeByte(offsets[8], object.tableType.index);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeLong(offsets[10], object.version);
}

BidaBlockPlan _bidaBlockPlanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaBlockPlan();
  object.blockHours = reader.readDouble(offsets[0]);
  object.blockPrice = reader.readDouble(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.extraHourPrice = reader.readDouble(offsets[4]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.planId = reader.readString(offsets[7]);
  object.tableType =
      _BidaBlockPlantableTypeValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          BidaTableType.LO;
  object.updatedAt = reader.readDateTime(offsets[9]);
  object.version = reader.readLong(offsets[10]);
  return object;
}

P _bidaBlockPlanDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_BidaBlockPlantableTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BidaTableType.LO) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BidaBlockPlantableTypeEnumValueMap = {
  'LO': 0,
  'LIBRE': 1,
  'BANG_3': 2,
};
const _BidaBlockPlantableTypeValueEnumMap = {
  0: BidaTableType.LO,
  1: BidaTableType.LIBRE,
  2: BidaTableType.BANG_3,
};

Id _bidaBlockPlanGetId(BidaBlockPlan object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bidaBlockPlanGetLinks(BidaBlockPlan object) {
  return [];
}

void _bidaBlockPlanAttach(
    IsarCollection<dynamic> col, Id id, BidaBlockPlan object) {
  object.id = id;
}

extension BidaBlockPlanByIndex on IsarCollection<BidaBlockPlan> {
  Future<BidaBlockPlan?> getByPlanId(String planId) {
    return getByIndex(r'planId', [planId]);
  }

  BidaBlockPlan? getByPlanIdSync(String planId) {
    return getByIndexSync(r'planId', [planId]);
  }

  Future<bool> deleteByPlanId(String planId) {
    return deleteByIndex(r'planId', [planId]);
  }

  bool deleteByPlanIdSync(String planId) {
    return deleteByIndexSync(r'planId', [planId]);
  }

  Future<List<BidaBlockPlan?>> getAllByPlanId(List<String> planIdValues) {
    final values = planIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'planId', values);
  }

  List<BidaBlockPlan?> getAllByPlanIdSync(List<String> planIdValues) {
    final values = planIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'planId', values);
  }

  Future<int> deleteAllByPlanId(List<String> planIdValues) {
    final values = planIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'planId', values);
  }

  int deleteAllByPlanIdSync(List<String> planIdValues) {
    final values = planIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'planId', values);
  }

  Future<Id> putByPlanId(BidaBlockPlan object) {
    return putByIndex(r'planId', object);
  }

  Id putByPlanIdSync(BidaBlockPlan object, {bool saveLinks = true}) {
    return putByIndexSync(r'planId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPlanId(List<BidaBlockPlan> objects) {
    return putAllByIndex(r'planId', objects);
  }

  List<Id> putAllByPlanIdSync(List<BidaBlockPlan> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'planId', objects, saveLinks: saveLinks);
  }
}

extension BidaBlockPlanQueryWhereSort
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QWhere> {
  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BidaBlockPlanQueryWhere
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QWhereClause> {
  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause> idBetween(
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause> planIdEqualTo(
      String planId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'planId',
        value: [planId],
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterWhereClause>
      planIdNotEqualTo(String planId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'planId',
              lower: [],
              upper: [planId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'planId',
              lower: [planId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'planId',
              lower: [planId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'planId',
              lower: [],
              upper: [planId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BidaBlockPlanQueryFilter
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QFilterCondition> {
  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockHoursEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockHoursGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockHoursLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockHours',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockHoursBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'blockPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'blockPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'blockPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      blockPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'blockPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      extraHourPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extraHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      extraHourPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extraHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      extraHourPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extraHourPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      extraHourPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extraHourPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'planId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'planId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'planId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'planId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'planId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'planId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'planId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'planId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      planIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'planId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      tableTypeEqualTo(BidaTableType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableType',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      tableTypeGreaterThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableType',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      tableTypeLessThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableType',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      tableTypeBetween(
    BidaTableType lower,
    BidaTableType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
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

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BidaBlockPlanQueryObject
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QFilterCondition> {}

extension BidaBlockPlanQueryLinks
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QFilterCondition> {}

extension BidaBlockPlanQuerySortBy
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QSortBy> {
  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByBlockHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockHours', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByBlockHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockHours', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByBlockPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByBlockPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByExtraHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraHourPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByExtraHourPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraHourPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByTableType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByTableTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BidaBlockPlanQuerySortThenBy
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QSortThenBy> {
  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByBlockHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockHours', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByBlockHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockHours', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByBlockPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByBlockPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'blockPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByExtraHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraHourPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByExtraHourPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extraHourPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'planId', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByTableType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByTableTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableType', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BidaBlockPlanQueryWhereDistinct
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> {
  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByBlockHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockHours');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByBlockPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'blockPrice');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct>
      distinctByExtraHourPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extraHourPrice');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByPlanId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'planId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByTableType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableType');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaBlockPlan, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension BidaBlockPlanQueryProperty
    on QueryBuilder<BidaBlockPlan, BidaBlockPlan, QQueryProperty> {
  QueryBuilder<BidaBlockPlan, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BidaBlockPlan, double, QQueryOperations> blockHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockHours');
    });
  }

  QueryBuilder<BidaBlockPlan, double, QQueryOperations> blockPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'blockPrice');
    });
  }

  QueryBuilder<BidaBlockPlan, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<BidaBlockPlan, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<BidaBlockPlan, double, QQueryOperations>
      extraHourPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extraHourPrice');
    });
  }

  QueryBuilder<BidaBlockPlan, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<BidaBlockPlan, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BidaBlockPlan, String, QQueryOperations> planIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'planId');
    });
  }

  QueryBuilder<BidaBlockPlan, BidaTableType, QQueryOperations>
      tableTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableType');
    });
  }

  QueryBuilder<BidaBlockPlan, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BidaBlockPlan, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBidaTableCollection on Isar {
  IsarCollection<BidaTable> get bidaTables => this.collection();
}

const BidaTableSchema = CollectionSchema(
  name: r'BidaTable',
  id: 4832202588143935937,
  properties: {
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 1,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'hourlyPrice': PropertySchema(
      id: 2,
      name: r'hourlyPrice',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BidaTablestatusEnumValueMap,
    ),
    r'tableId': PropertySchema(
      id: 6,
      name: r'tableId',
      type: IsarType.string,
    ),
    r'timeBlock': PropertySchema(
      id: 7,
      name: r'timeBlock',
      type: IsarType.byte,
      enumMap: _BidaTabletimeBlockEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 8,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BidaTabletypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 10,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _bidaTableEstimateSize,
  serialize: _bidaTableSerialize,
  deserialize: _bidaTableDeserialize,
  deserializeProp: _bidaTableDeserializeProp,
  idName: r'id',
  indexes: {
    r'tableId': IndexSchema(
      id: 519297262500120396,
      name: r'tableId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tableId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bidaTableGetId,
  getLinks: _bidaTableGetLinks,
  attach: _bidaTableAttach,
  version: '3.1.0+1',
);

int _bidaTableEstimateSize(
  BidaTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tableId.length * 3;
  return bytesCount;
}

void _bidaTableSerialize(
  BidaTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeDouble(offsets[2], object.hourlyPrice);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.name);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeString(offsets[6], object.tableId);
  writer.writeByte(offsets[7], object.timeBlock.index);
  writer.writeByte(offsets[8], object.type.index);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeLong(offsets[10], object.version);
}

BidaTable _bidaTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaTable();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.hourlyPrice = reader.readDouble(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.status =
      _BidaTablestatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          BidaTableStatus.EMPTY;
  object.tableId = reader.readString(offsets[6]);
  object.timeBlock =
      _BidaTabletimeBlockValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          BidaTimeBlock.MINUTE_1;
  object.type = _BidaTabletypeValueEnumMap[reader.readByteOrNull(offsets[8])] ??
      BidaTableType.LO;
  object.updatedAt = reader.readDateTime(offsets[9]);
  object.version = reader.readLong(offsets[10]);
  return object;
}

P _bidaTableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_BidaTablestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaTableStatus.EMPTY) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_BidaTabletimeBlockValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaTimeBlock.MINUTE_1) as P;
    case 8:
      return (_BidaTabletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaTableType.LO) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BidaTablestatusEnumValueMap = {
  'EMPTY': 0,
  'PLAYING': 1,
  'RESERVED': 2,
  'MAINTENANCE': 3,
  'CLEANING': 4,
};
const _BidaTablestatusValueEnumMap = {
  0: BidaTableStatus.EMPTY,
  1: BidaTableStatus.PLAYING,
  2: BidaTableStatus.RESERVED,
  3: BidaTableStatus.MAINTENANCE,
  4: BidaTableStatus.CLEANING,
};
const _BidaTabletimeBlockEnumValueMap = {
  'MINUTE_1': 0,
  'MINUTE_15': 1,
  'MINUTE_30': 2,
  'MINUTE_60': 3,
};
const _BidaTabletimeBlockValueEnumMap = {
  0: BidaTimeBlock.MINUTE_1,
  1: BidaTimeBlock.MINUTE_15,
  2: BidaTimeBlock.MINUTE_30,
  3: BidaTimeBlock.MINUTE_60,
};
const _BidaTabletypeEnumValueMap = {
  'LO': 0,
  'LIBRE': 1,
  'BANG_3': 2,
};
const _BidaTabletypeValueEnumMap = {
  0: BidaTableType.LO,
  1: BidaTableType.LIBRE,
  2: BidaTableType.BANG_3,
};

Id _bidaTableGetId(BidaTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bidaTableGetLinks(BidaTable object) {
  return [];
}

void _bidaTableAttach(IsarCollection<dynamic> col, Id id, BidaTable object) {
  object.id = id;
}

extension BidaTableByIndex on IsarCollection<BidaTable> {
  Future<BidaTable?> getByTableId(String tableId) {
    return getByIndex(r'tableId', [tableId]);
  }

  BidaTable? getByTableIdSync(String tableId) {
    return getByIndexSync(r'tableId', [tableId]);
  }

  Future<bool> deleteByTableId(String tableId) {
    return deleteByIndex(r'tableId', [tableId]);
  }

  bool deleteByTableIdSync(String tableId) {
    return deleteByIndexSync(r'tableId', [tableId]);
  }

  Future<List<BidaTable?>> getAllByTableId(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tableId', values);
  }

  List<BidaTable?> getAllByTableIdSync(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tableId', values);
  }

  Future<int> deleteAllByTableId(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tableId', values);
  }

  int deleteAllByTableIdSync(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tableId', values);
  }

  Future<Id> putByTableId(BidaTable object) {
    return putByIndex(r'tableId', object);
  }

  Id putByTableIdSync(BidaTable object, {bool saveLinks = true}) {
    return putByIndexSync(r'tableId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTableId(List<BidaTable> objects) {
    return putAllByIndex(r'tableId', objects);
  }

  List<Id> putAllByTableIdSync(List<BidaTable> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tableId', objects, saveLinks: saveLinks);
  }
}

extension BidaTableQueryWhereSort
    on QueryBuilder<BidaTable, BidaTable, QWhere> {
  QueryBuilder<BidaTable, BidaTable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BidaTableQueryWhere
    on QueryBuilder<BidaTable, BidaTable, QWhereClause> {
  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idBetween(
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

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> tableIdEqualTo(
      String tableId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tableId',
        value: [tableId],
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> tableIdNotEqualTo(
      String tableId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [],
              upper: [tableId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [tableId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [tableId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [],
              upper: [tableId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BidaTableQueryFilter
    on QueryBuilder<BidaTable, BidaTable, QFilterCondition> {
  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> hourlyPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      hourlyPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> hourlyPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> hourlyPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hourlyPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusEqualTo(
      BidaTableStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusGreaterThan(
    BidaTableStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusLessThan(
    BidaTableStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusBetween(
    BidaTableStatus lower,
    BidaTableStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tableId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      tableIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tableId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> timeBlockEqualTo(
      BidaTimeBlock value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      timeBlockGreaterThan(
    BidaTimeBlock value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> timeBlockLessThan(
    BidaTimeBlock value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> timeBlockBetween(
    BidaTimeBlock lower,
    BidaTimeBlock upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeBlock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeEqualTo(
      BidaTableType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeGreaterThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeLessThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeBetween(
    BidaTableType lower,
    BidaTableType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BidaTableQueryObject
    on QueryBuilder<BidaTable, BidaTable, QFilterCondition> {}

extension BidaTableQueryLinks
    on QueryBuilder<BidaTable, BidaTable, QFilterCondition> {}

extension BidaTableQuerySortBy on QueryBuilder<BidaTable, BidaTable, QSortBy> {
  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTimeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTimeBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BidaTableQuerySortThenBy
    on QueryBuilder<BidaTable, BidaTable, QSortThenBy> {
  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTimeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTimeBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension BidaTableQueryWhereDistinct
    on QueryBuilder<BidaTable, BidaTable, QDistinct> {
  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hourlyPrice');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByTableId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByTimeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeBlock');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension BidaTableQueryProperty
    on QueryBuilder<BidaTable, BidaTable, QQueryProperty> {
  QueryBuilder<BidaTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BidaTable, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<BidaTable, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<BidaTable, double, QQueryOperations> hourlyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hourlyPrice');
    });
  }

  QueryBuilder<BidaTable, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<BidaTable, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BidaTable, BidaTableStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BidaTable, String, QQueryOperations> tableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableId');
    });
  }

  QueryBuilder<BidaTable, BidaTimeBlock, QQueryOperations> timeBlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeBlock');
    });
  }

  QueryBuilder<BidaTable, BidaTableType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<BidaTable, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BidaTable, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
