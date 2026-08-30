// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tt_loyalty.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTtLoyaltyRuleCollection on Isar {
  IsarCollection<TtLoyaltyRule> get ttLoyaltyRules => this.collection();
}

const TtLoyaltyRuleSchema = CollectionSchema(
  name: r'TtLoyaltyRule',
  id: 6422294230873185514,
  properties: {
    r'amountPerPoint': PropertySchema(
      id: 0,
      name: r'amountPerPoint',
      type: IsarType.double,
    ),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 2,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 3,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'minimumInvoice': PropertySchema(
      id: 5,
      name: r'minimumInvoice',
      type: IsarType.double,
    ),
    r'pointPerAmount': PropertySchema(
      id: 6,
      name: r'pointPerAmount',
      type: IsarType.double,
    ),
    r'ruleId': PropertySchema(
      id: 7,
      name: r'ruleId',
      type: IsarType.string,
    ),
    r'ruleName': PropertySchema(
      id: 8,
      name: r'ruleName',
      type: IsarType.string,
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
  estimateSize: _ttLoyaltyRuleEstimateSize,
  serialize: _ttLoyaltyRuleSerialize,
  deserialize: _ttLoyaltyRuleDeserialize,
  deserializeProp: _ttLoyaltyRuleDeserializeProp,
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
  getId: _ttLoyaltyRuleGetId,
  getLinks: _ttLoyaltyRuleGetLinks,
  attach: _ttLoyaltyRuleAttach,
  version: '3.1.0+1',
);

int _ttLoyaltyRuleEstimateSize(
  TtLoyaltyRule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.ruleId.length * 3;
  bytesCount += 3 + object.ruleName.length * 3;
  return bytesCount;
}

void _ttLoyaltyRuleSerialize(
  TtLoyaltyRule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amountPerPoint);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeDouble(offsets[5], object.minimumInvoice);
  writer.writeDouble(offsets[6], object.pointPerAmount);
  writer.writeString(offsets[7], object.ruleId);
  writer.writeString(offsets[8], object.ruleName);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeLong(offsets[10], object.version);
}

TtLoyaltyRule _ttLoyaltyRuleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TtLoyaltyRule();
  object.amountPerPoint = reader.readDouble(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.isSynced = reader.readBool(offsets[4]);
  object.minimumInvoice = reader.readDouble(offsets[5]);
  object.pointPerAmount = reader.readDouble(offsets[6]);
  object.ruleId = reader.readString(offsets[7]);
  object.ruleName = reader.readString(offsets[8]);
  object.updatedAt = reader.readDateTime(offsets[9]);
  object.version = reader.readLong(offsets[10]);
  return object;
}

P _ttLoyaltyRuleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ttLoyaltyRuleGetId(TtLoyaltyRule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ttLoyaltyRuleGetLinks(TtLoyaltyRule object) {
  return [];
}

void _ttLoyaltyRuleAttach(
    IsarCollection<dynamic> col, Id id, TtLoyaltyRule object) {
  object.id = id;
}

extension TtLoyaltyRuleByIndex on IsarCollection<TtLoyaltyRule> {
  Future<TtLoyaltyRule?> getByRuleId(String ruleId) {
    return getByIndex(r'ruleId', [ruleId]);
  }

  TtLoyaltyRule? getByRuleIdSync(String ruleId) {
    return getByIndexSync(r'ruleId', [ruleId]);
  }

  Future<bool> deleteByRuleId(String ruleId) {
    return deleteByIndex(r'ruleId', [ruleId]);
  }

  bool deleteByRuleIdSync(String ruleId) {
    return deleteByIndexSync(r'ruleId', [ruleId]);
  }

  Future<List<TtLoyaltyRule?>> getAllByRuleId(List<String> ruleIdValues) {
    final values = ruleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ruleId', values);
  }

  List<TtLoyaltyRule?> getAllByRuleIdSync(List<String> ruleIdValues) {
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

  Future<Id> putByRuleId(TtLoyaltyRule object) {
    return putByIndex(r'ruleId', object);
  }

  Id putByRuleIdSync(TtLoyaltyRule object, {bool saveLinks = true}) {
    return putByIndexSync(r'ruleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRuleId(List<TtLoyaltyRule> objects) {
    return putAllByIndex(r'ruleId', objects);
  }

  List<Id> putAllByRuleIdSync(List<TtLoyaltyRule> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ruleId', objects, saveLinks: saveLinks);
  }
}

extension TtLoyaltyRuleQueryWhereSort
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QWhere> {
  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TtLoyaltyRuleQueryWhere
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QWhereClause> {
  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause> idBetween(
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause> ruleIdEqualTo(
      String ruleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ruleId',
        value: [ruleId],
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterWhereClause>
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

extension TtLoyaltyRuleQueryFilter
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QFilterCondition> {
  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      amountPerPointEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountPerPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      amountPerPointGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountPerPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      amountPerPointLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountPerPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      amountPerPointBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountPerPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      minimumInvoiceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minimumInvoice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      minimumInvoiceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minimumInvoice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      minimumInvoiceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minimumInvoice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      minimumInvoiceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minimumInvoice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      pointPerAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pointPerAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      pointPerAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pointPerAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      pointPerAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pointPerAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      pointPerAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pointPerAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      ruleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruleName',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterFilterCondition>
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

extension TtLoyaltyRuleQueryObject
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QFilterCondition> {}

extension TtLoyaltyRuleQueryLinks
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QFilterCondition> {}

extension TtLoyaltyRuleQuerySortBy
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QSortBy> {
  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByAmountPerPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPerPoint', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByAmountPerPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPerPoint', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByMinimumInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumInvoice', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByMinimumInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumInvoice', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByPointPerAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointPerAmount', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByPointPerAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointPerAmount', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByRuleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByRuleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtLoyaltyRuleQuerySortThenBy
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QSortThenBy> {
  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByAmountPerPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPerPoint', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByAmountPerPointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountPerPoint', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByMinimumInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumInvoice', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByMinimumInvoiceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minimumInvoice', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByPointPerAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointPerAmount', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByPointPerAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pointPerAmount', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByRuleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByRuleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByRuleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByRuleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruleName', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtLoyaltyRuleQueryWhereDistinct
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> {
  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct>
      distinctByAmountPerPoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountPerPoint');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct>
      distinctByMinimumInvoice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minimumInvoice');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct>
      distinctByPointPerAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pointPerAmount');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByRuleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByRuleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TtLoyaltyRuleQueryProperty
    on QueryBuilder<TtLoyaltyRule, TtLoyaltyRule, QQueryProperty> {
  QueryBuilder<TtLoyaltyRule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TtLoyaltyRule, double, QQueryOperations>
      amountPerPointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountPerPoint');
    });
  }

  QueryBuilder<TtLoyaltyRule, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TtLoyaltyRule, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TtLoyaltyRule, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<TtLoyaltyRule, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TtLoyaltyRule, double, QQueryOperations>
      minimumInvoiceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minimumInvoice');
    });
  }

  QueryBuilder<TtLoyaltyRule, double, QQueryOperations>
      pointPerAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pointPerAmount');
    });
  }

  QueryBuilder<TtLoyaltyRule, String, QQueryOperations> ruleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleId');
    });
  }

  QueryBuilder<TtLoyaltyRule, String, QQueryOperations> ruleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruleName');
    });
  }

  QueryBuilder<TtLoyaltyRule, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TtLoyaltyRule, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTtLoyaltyTransactionCollection on Isar {
  IsarCollection<TtLoyaltyTransaction> get ttLoyaltyTransactions =>
      this.collection();
}

const TtLoyaltyTransactionSchema = CollectionSchema(
  name: r'TtLoyaltyTransaction',
  id: -6646851754750123954,
  properties: {
    r'balanceAfter': PropertySchema(
      id: 0,
      name: r'balanceAfter',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 2,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 4,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'invoiceId': PropertySchema(
      id: 5,
      name: r'invoiceId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'loyaltyTxId': PropertySchema(
      id: 7,
      name: r'loyaltyTxId',
      type: IsarType.string,
    ),
    r'points': PropertySchema(
      id: 8,
      name: r'points',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 9,
      name: r'type',
      type: IsarType.byte,
      enumMap: _TtLoyaltyTransactiontypeEnumValueMap,
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
    )
  },
  estimateSize: _ttLoyaltyTransactionEstimateSize,
  serialize: _ttLoyaltyTransactionSerialize,
  deserialize: _ttLoyaltyTransactionDeserialize,
  deserializeProp: _ttLoyaltyTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'loyaltyTxId': IndexSchema(
      id: 4855542565823457594,
      name: r'loyaltyTxId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'loyaltyTxId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'customer': LinkSchema(
      id: -3981224076161480823,
      name: r'customer',
      target: r'TtCustomer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _ttLoyaltyTransactionGetId,
  getLinks: _ttLoyaltyTransactionGetLinks,
  attach: _ttLoyaltyTransactionAttach,
  version: '3.1.0+1',
);

int _ttLoyaltyTransactionEstimateSize(
  TtLoyaltyTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.invoiceId.length * 3;
  bytesCount += 3 + object.loyaltyTxId.length * 3;
  return bytesCount;
}

void _ttLoyaltyTransactionSerialize(
  TtLoyaltyTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.balanceAfter);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.deviceId);
  writer.writeString(offsets[5], object.invoiceId);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.loyaltyTxId);
  writer.writeDouble(offsets[8], object.points);
  writer.writeByte(offsets[9], object.type.index);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.version);
}

TtLoyaltyTransaction _ttLoyaltyTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TtLoyaltyTransaction();
  object.balanceAfter = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.description = reader.readString(offsets[3]);
  object.deviceId = reader.readString(offsets[4]);
  object.id = id;
  object.invoiceId = reader.readString(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.loyaltyTxId = reader.readString(offsets[7]);
  object.points = reader.readDouble(offsets[8]);
  object.type = _TtLoyaltyTransactiontypeValueEnumMap[
          reader.readByteOrNull(offsets[9])] ??
      TtLoyaltyType.EARN;
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.version = reader.readLong(offsets[11]);
  return object;
}

P _ttLoyaltyTransactionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (_TtLoyaltyTransactiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TtLoyaltyType.EARN) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TtLoyaltyTransactiontypeEnumValueMap = {
  'EARN': 0,
  'REDEEM': 1,
  'ADJUST': 2,
  'EXPIRE': 3,
  'REFUND': 4,
};
const _TtLoyaltyTransactiontypeValueEnumMap = {
  0: TtLoyaltyType.EARN,
  1: TtLoyaltyType.REDEEM,
  2: TtLoyaltyType.ADJUST,
  3: TtLoyaltyType.EXPIRE,
  4: TtLoyaltyType.REFUND,
};

Id _ttLoyaltyTransactionGetId(TtLoyaltyTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ttLoyaltyTransactionGetLinks(
    TtLoyaltyTransaction object) {
  return [object.customer];
}

void _ttLoyaltyTransactionAttach(
    IsarCollection<dynamic> col, Id id, TtLoyaltyTransaction object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<TtCustomer>(), r'customer', id);
}

extension TtLoyaltyTransactionByIndex on IsarCollection<TtLoyaltyTransaction> {
  Future<TtLoyaltyTransaction?> getByLoyaltyTxId(String loyaltyTxId) {
    return getByIndex(r'loyaltyTxId', [loyaltyTxId]);
  }

  TtLoyaltyTransaction? getByLoyaltyTxIdSync(String loyaltyTxId) {
    return getByIndexSync(r'loyaltyTxId', [loyaltyTxId]);
  }

  Future<bool> deleteByLoyaltyTxId(String loyaltyTxId) {
    return deleteByIndex(r'loyaltyTxId', [loyaltyTxId]);
  }

  bool deleteByLoyaltyTxIdSync(String loyaltyTxId) {
    return deleteByIndexSync(r'loyaltyTxId', [loyaltyTxId]);
  }

  Future<List<TtLoyaltyTransaction?>> getAllByLoyaltyTxId(
      List<String> loyaltyTxIdValues) {
    final values = loyaltyTxIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'loyaltyTxId', values);
  }

  List<TtLoyaltyTransaction?> getAllByLoyaltyTxIdSync(
      List<String> loyaltyTxIdValues) {
    final values = loyaltyTxIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'loyaltyTxId', values);
  }

  Future<int> deleteAllByLoyaltyTxId(List<String> loyaltyTxIdValues) {
    final values = loyaltyTxIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'loyaltyTxId', values);
  }

  int deleteAllByLoyaltyTxIdSync(List<String> loyaltyTxIdValues) {
    final values = loyaltyTxIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'loyaltyTxId', values);
  }

  Future<Id> putByLoyaltyTxId(TtLoyaltyTransaction object) {
    return putByIndex(r'loyaltyTxId', object);
  }

  Id putByLoyaltyTxIdSync(TtLoyaltyTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'loyaltyTxId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLoyaltyTxId(List<TtLoyaltyTransaction> objects) {
    return putAllByIndex(r'loyaltyTxId', objects);
  }

  List<Id> putAllByLoyaltyTxIdSync(List<TtLoyaltyTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'loyaltyTxId', objects, saveLinks: saveLinks);
  }
}

extension TtLoyaltyTransactionQueryWhereSort
    on QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QWhere> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TtLoyaltyTransactionQueryWhere
    on QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QWhereClause> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
      loyaltyTxIdEqualTo(String loyaltyTxId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'loyaltyTxId',
        value: [loyaltyTxId],
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterWhereClause>
      loyaltyTxIdNotEqualTo(String loyaltyTxId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loyaltyTxId',
              lower: [],
              upper: [loyaltyTxId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loyaltyTxId',
              lower: [loyaltyTxId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loyaltyTxId',
              lower: [loyaltyTxId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'loyaltyTxId',
              lower: [],
              upper: [loyaltyTxId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TtLoyaltyTransactionQueryFilter on QueryBuilder<TtLoyaltyTransaction,
    TtLoyaltyTransaction, QFilterCondition> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> balanceAfterEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balanceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> balanceAfterGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balanceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> balanceAfterLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balanceAfter',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> balanceAfterBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balanceAfter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionEqualTo(
    String value, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionGreaterThan(
    String value, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionLessThan(
    String value, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      invoiceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      invoiceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> invoiceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loyaltyTxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loyaltyTxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loyaltyTxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loyaltyTxId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'loyaltyTxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'loyaltyTxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      loyaltyTxIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'loyaltyTxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
          QAfterFilterCondition>
      loyaltyTxIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'loyaltyTxId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loyaltyTxId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> loyaltyTxIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'loyaltyTxId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> pointsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'points',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> pointsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'points',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> pointsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'points',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> pointsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'points',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> typeEqualTo(TtLoyaltyType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> typeGreaterThan(
    TtLoyaltyType value, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> typeLessThan(
    TtLoyaltyType value, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> typeBetween(
    TtLoyaltyType lower,
    TtLoyaltyType upper, {
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> versionBetween(
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

extension TtLoyaltyTransactionQueryObject on QueryBuilder<TtLoyaltyTransaction,
    TtLoyaltyTransaction, QFilterCondition> {}

extension TtLoyaltyTransactionQueryLinks on QueryBuilder<TtLoyaltyTransaction,
    TtLoyaltyTransaction, QFilterCondition> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> customer(FilterQuery<TtCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction,
      QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }
}

extension TtLoyaltyTransactionQuerySortBy
    on QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QSortBy> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByBalanceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAfter', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByBalanceAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAfter', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByInvoiceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByInvoiceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByLoyaltyTxId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loyaltyTxId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByLoyaltyTxIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loyaltyTxId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtLoyaltyTransactionQuerySortThenBy
    on QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QSortThenBy> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByBalanceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAfter', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByBalanceAfterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balanceAfter', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByInvoiceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByInvoiceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByLoyaltyTxId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loyaltyTxId', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByLoyaltyTxIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loyaltyTxId', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'points', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtLoyaltyTransactionQueryWhereDistinct
    on QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct> {
  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByBalanceAfter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balanceAfter');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByInvoiceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByLoyaltyTxId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loyaltyTxId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'points');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyTransaction, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TtLoyaltyTransactionQueryProperty on QueryBuilder<
    TtLoyaltyTransaction, TtLoyaltyTransaction, QQueryProperty> {
  QueryBuilder<TtLoyaltyTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, double, QQueryOperations>
      balanceAfterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balanceAfter');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, String, QQueryOperations>
      invoiceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceId');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, String, QQueryOperations>
      loyaltyTxIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loyaltyTxId');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, double, QQueryOperations>
      pointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'points');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, TtLoyaltyType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TtLoyaltyTransaction, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
