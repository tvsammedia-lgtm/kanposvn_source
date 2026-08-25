// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_ops_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanRidePromotionCollection on Isar {
  IsarCollection<KanRidePromotion> get kanRidePromotions => this.collection();
}

const KanRidePromotionSchema = CollectionSchema(
  name: r'KanRidePromotion',
  id: 2441774146237485239,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'code': PropertySchema(
      id: 1,
      name: r'code',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'maxDiscount': PropertySchema(
      id: 4,
      name: r'maxDiscount',
      type: IsarType.double,
    ),
    r'minFare': PropertySchema(
      id: 5,
      name: r'minFare',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 6,
      name: r'type',
      type: IsarType.string,
    ),
    r'usageCount': PropertySchema(
      id: 7,
      name: r'usageCount',
      type: IsarType.long,
    ),
    r'validFrom': PropertySchema(
      id: 8,
      name: r'validFrom',
      type: IsarType.dateTime,
    ),
    r'validTo': PropertySchema(
      id: 9,
      name: r'validTo',
      type: IsarType.dateTime,
    ),
    r'value': PropertySchema(
      id: 10,
      name: r'value',
      type: IsarType.double,
    )
  },
  estimateSize: _kanRidePromotionEstimateSize,
  serialize: _kanRidePromotionSerialize,
  deserialize: _kanRidePromotionDeserialize,
  deserializeProp: _kanRidePromotionDeserializeProp,
  idName: r'id',
  indexes: {
    r'code': IndexSchema(
      id: 329780482934683790,
      name: r'code',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'code',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _kanRidePromotionGetId,
  getLinks: _kanRidePromotionGetLinks,
  attach: _kanRidePromotionAttach,
  version: '3.1.0+1',
);

int _kanRidePromotionEstimateSize(
  KanRidePromotion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _kanRidePromotionSerialize(
  KanRidePromotion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.code);
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeDouble(offsets[4], object.maxDiscount);
  writer.writeDouble(offsets[5], object.minFare);
  writer.writeString(offsets[6], object.type);
  writer.writeLong(offsets[7], object.usageCount);
  writer.writeDateTime(offsets[8], object.validFrom);
  writer.writeDateTime(offsets[9], object.validTo);
  writer.writeDouble(offsets[10], object.value);
}

KanRidePromotion _kanRidePromotionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanRidePromotion();
  object.active = reader.readBool(offsets[0]);
  object.code = reader.readString(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.maxDiscount = reader.readDouble(offsets[4]);
  object.minFare = reader.readDouble(offsets[5]);
  object.type = reader.readString(offsets[6]);
  object.usageCount = reader.readLong(offsets[7]);
  object.validFrom = reader.readDateTimeOrNull(offsets[8]);
  object.validTo = reader.readDateTimeOrNull(offsets[9]);
  object.value = reader.readDouble(offsets[10]);
  return object;
}

P _kanRidePromotionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanRidePromotionGetId(KanRidePromotion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kanRidePromotionGetLinks(KanRidePromotion object) {
  return [];
}

void _kanRidePromotionAttach(
    IsarCollection<dynamic> col, Id id, KanRidePromotion object) {
  object.id = id;
}

extension KanRidePromotionByIndex on IsarCollection<KanRidePromotion> {
  Future<KanRidePromotion?> getByCode(String code) {
    return getByIndex(r'code', [code]);
  }

  KanRidePromotion? getByCodeSync(String code) {
    return getByIndexSync(r'code', [code]);
  }

  Future<bool> deleteByCode(String code) {
    return deleteByIndex(r'code', [code]);
  }

  bool deleteByCodeSync(String code) {
    return deleteByIndexSync(r'code', [code]);
  }

  Future<List<KanRidePromotion?>> getAllByCode(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return getAllByIndex(r'code', values);
  }

  List<KanRidePromotion?> getAllByCodeSync(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'code', values);
  }

  Future<int> deleteAllByCode(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'code', values);
  }

  int deleteAllByCodeSync(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'code', values);
  }

  Future<Id> putByCode(KanRidePromotion object) {
    return putByIndex(r'code', object);
  }

  Id putByCodeSync(KanRidePromotion object, {bool saveLinks = true}) {
    return putByIndexSync(r'code', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCode(List<KanRidePromotion> objects) {
    return putAllByIndex(r'code', objects);
  }

  List<Id> putAllByCodeSync(List<KanRidePromotion> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'code', objects, saveLinks: saveLinks);
  }
}

extension KanRidePromotionQueryWhereSort
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QWhere> {
  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanRidePromotionQueryWhere
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QWhereClause> {
  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause>
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause> idBetween(
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause>
      codeEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'code',
        value: [code],
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterWhereClause>
      codeNotEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [],
              upper: [code],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [code],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [code],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [],
              upper: [code],
              includeUpper: false,
            ));
      }
    });
  }
}

extension KanRidePromotionQueryFilter
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QFilterCondition> {
  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
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

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      maxDiscountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      maxDiscountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      maxDiscountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      maxDiscountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      minFareEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      minFareGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      minFareLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minFare',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      minFareBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minFare',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      usageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      usageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      usageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      usageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validFromIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validFrom',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validFromIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validFrom',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validFromEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validFromGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validFromLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validFromBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validFrom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validToIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validTo',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validToIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validTo',
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validToEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validToGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validToLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validTo',
        value: value,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      validToBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validTo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      valueEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      valueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      valueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterFilterCondition>
      valueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension KanRidePromotionQueryObject
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QFilterCondition> {}

extension KanRidePromotionQueryLinks
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QFilterCondition> {}

extension KanRidePromotionQuerySortBy
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QSortBy> {
  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByMaxDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByMaxDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByMinFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minFare', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByMinFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minFare', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByValidFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByValidToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension KanRidePromotionQuerySortThenBy
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QSortThenBy> {
  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByMaxDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByMaxDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDiscount', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByMinFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minFare', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByMinFareDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minFare', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByValidFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByValidToDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validTo', Sort.desc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy> thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }
}

extension KanRidePromotionQueryWhereDistinct
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct> {
  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByMaxDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxDiscount');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByMinFare() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minFare');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageCount');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validFrom');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByValidTo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validTo');
    });
  }

  QueryBuilder<KanRidePromotion, KanRidePromotion, QDistinct>
      distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }
}

extension KanRidePromotionQueryProperty
    on QueryBuilder<KanRidePromotion, KanRidePromotion, QQueryProperty> {
  QueryBuilder<KanRidePromotion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KanRidePromotion, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<KanRidePromotion, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<KanRidePromotion, String, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<KanRidePromotion, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<KanRidePromotion, double, QQueryOperations>
      maxDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxDiscount');
    });
  }

  QueryBuilder<KanRidePromotion, double, QQueryOperations> minFareProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minFare');
    });
  }

  QueryBuilder<KanRidePromotion, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<KanRidePromotion, int, QQueryOperations> usageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageCount');
    });
  }

  QueryBuilder<KanRidePromotion, DateTime?, QQueryOperations>
      validFromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validFrom');
    });
  }

  QueryBuilder<KanRidePromotion, DateTime?, QQueryOperations>
      validToProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validTo');
    });
  }

  QueryBuilder<KanRidePromotion, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideRatingCollection on Isar {
  IsarCollection<RideRating> get rideRatings => this.collection();
}

const RideRatingSchema = CollectionSchema(
  name: r'RideRating',
  id: 8290904320028175270,
  properties: {
    r'bookingUuid': PropertySchema(
      id: 0,
      name: r'bookingUuid',
      type: IsarType.string,
    ),
    r'comment': PropertySchema(
      id: 1,
      name: r'comment',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'driverUuid': PropertySchema(
      id: 3,
      name: r'driverUuid',
      type: IsarType.string,
    ),
    r'isComplaint': PropertySchema(
      id: 4,
      name: r'isComplaint',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'passengerUuid': PropertySchema(
      id: 6,
      name: r'passengerUuid',
      type: IsarType.string,
    ),
    r'ratingId': PropertySchema(
      id: 7,
      name: r'ratingId',
      type: IsarType.string,
    ),
    r'stars': PropertySchema(
      id: 8,
      name: r'stars',
      type: IsarType.long,
    )
  },
  estimateSize: _rideRatingEstimateSize,
  serialize: _rideRatingSerialize,
  deserialize: _rideRatingDeserialize,
  deserializeProp: _rideRatingDeserializeProp,
  idName: r'id',
  indexes: {
    r'ratingId': IndexSchema(
      id: -7649693728914769981,
      name: r'ratingId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'ratingId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'bookingUuid': IndexSchema(
      id: 7512254276217561001,
      name: r'bookingUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookingUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'driverUuid': IndexSchema(
      id: 3863677328561972722,
      name: r'driverUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'driverUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideRatingGetId,
  getLinks: _rideRatingGetLinks,
  attach: _rideRatingAttach,
  version: '3.1.0+1',
);

int _rideRatingEstimateSize(
  RideRating object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookingUuid.length * 3;
  bytesCount += 3 + object.comment.length * 3;
  bytesCount += 3 + object.driverUuid.length * 3;
  bytesCount += 3 + object.passengerUuid.length * 3;
  bytesCount += 3 + object.ratingId.length * 3;
  return bytesCount;
}

void _rideRatingSerialize(
  RideRating object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookingUuid);
  writer.writeString(offsets[1], object.comment);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.driverUuid);
  writer.writeBool(offsets[4], object.isComplaint);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.passengerUuid);
  writer.writeString(offsets[7], object.ratingId);
  writer.writeLong(offsets[8], object.stars);
}

RideRating _rideRatingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideRating();
  object.bookingUuid = reader.readString(offsets[0]);
  object.comment = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.driverUuid = reader.readString(offsets[3]);
  object.id = id;
  object.isComplaint = reader.readBool(offsets[4]);
  object.isSynced = reader.readBool(offsets[5]);
  object.passengerUuid = reader.readString(offsets[6]);
  object.ratingId = reader.readString(offsets[7]);
  object.stars = reader.readLong(offsets[8]);
  return object;
}

P _rideRatingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideRatingGetId(RideRating object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideRatingGetLinks(RideRating object) {
  return [];
}

void _rideRatingAttach(IsarCollection<dynamic> col, Id id, RideRating object) {
  object.id = id;
}

extension RideRatingByIndex on IsarCollection<RideRating> {
  Future<RideRating?> getByRatingId(String ratingId) {
    return getByIndex(r'ratingId', [ratingId]);
  }

  RideRating? getByRatingIdSync(String ratingId) {
    return getByIndexSync(r'ratingId', [ratingId]);
  }

  Future<bool> deleteByRatingId(String ratingId) {
    return deleteByIndex(r'ratingId', [ratingId]);
  }

  bool deleteByRatingIdSync(String ratingId) {
    return deleteByIndexSync(r'ratingId', [ratingId]);
  }

  Future<List<RideRating?>> getAllByRatingId(List<String> ratingIdValues) {
    final values = ratingIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ratingId', values);
  }

  List<RideRating?> getAllByRatingIdSync(List<String> ratingIdValues) {
    final values = ratingIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'ratingId', values);
  }

  Future<int> deleteAllByRatingId(List<String> ratingIdValues) {
    final values = ratingIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'ratingId', values);
  }

  int deleteAllByRatingIdSync(List<String> ratingIdValues) {
    final values = ratingIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'ratingId', values);
  }

  Future<Id> putByRatingId(RideRating object) {
    return putByIndex(r'ratingId', object);
  }

  Id putByRatingIdSync(RideRating object, {bool saveLinks = true}) {
    return putByIndexSync(r'ratingId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRatingId(List<RideRating> objects) {
    return putAllByIndex(r'ratingId', objects);
  }

  List<Id> putAllByRatingIdSync(List<RideRating> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ratingId', objects, saveLinks: saveLinks);
  }
}

extension RideRatingQueryWhereSort
    on QueryBuilder<RideRating, RideRating, QWhere> {
  QueryBuilder<RideRating, RideRating, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideRatingQueryWhere
    on QueryBuilder<RideRating, RideRating, QWhereClause> {
  QueryBuilder<RideRating, RideRating, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> ratingIdEqualTo(
      String ratingId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ratingId',
        value: [ratingId],
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> ratingIdNotEqualTo(
      String ratingId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ratingId',
              lower: [],
              upper: [ratingId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ratingId',
              lower: [ratingId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ratingId',
              lower: [ratingId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ratingId',
              lower: [],
              upper: [ratingId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> bookingUuidEqualTo(
      String bookingUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookingUuid',
        value: [bookingUuid],
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> bookingUuidNotEqualTo(
      String bookingUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [],
              upper: [bookingUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [bookingUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [bookingUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [],
              upper: [bookingUuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> driverUuidEqualTo(
      String driverUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverUuid',
        value: [driverUuid],
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterWhereClause> driverUuidNotEqualTo(
      String driverUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [],
              upper: [driverUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [driverUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [driverUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverUuid',
              lower: [],
              upper: [driverUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideRatingQueryFilter
    on QueryBuilder<RideRating, RideRating, QFilterCondition> {
  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      bookingUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      commentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
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

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> driverUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> driverUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> driverUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      driverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      isComplaintEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isComplaint',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passengerUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passengerUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passengerUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      passengerUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passengerUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> ratingIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ratingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      ratingIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ratingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> ratingIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ratingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> ratingIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ratingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      ratingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ratingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> ratingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ratingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> ratingIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ratingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> ratingIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ratingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      ratingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ratingId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition>
      ratingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ratingId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> starsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> starsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> starsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterFilterCondition> starsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stars',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RideRatingQueryObject
    on QueryBuilder<RideRating, RideRating, QFilterCondition> {}

extension RideRatingQueryLinks
    on QueryBuilder<RideRating, RideRating, QFilterCondition> {}

extension RideRatingQuerySortBy
    on QueryBuilder<RideRating, RideRating, QSortBy> {
  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByIsComplaint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplaint', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByIsComplaintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplaint', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByPassengerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByPassengerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByRatingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingId', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByRatingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingId', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> sortByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }
}

extension RideRatingQuerySortThenBy
    on QueryBuilder<RideRating, RideRating, QSortThenBy> {
  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByIsComplaint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplaint', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByIsComplaintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isComplaint', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByPassengerUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByPassengerUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerUuid', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByRatingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingId', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByRatingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingId', Sort.desc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<RideRating, RideRating, QAfterSortBy> thenByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }
}

extension RideRatingQueryWhereDistinct
    on QueryBuilder<RideRating, RideRating, QDistinct> {
  QueryBuilder<RideRating, RideRating, QDistinct> distinctByBookingUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByDriverUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByIsComplaint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isComplaint');
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByPassengerUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passengerUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByRatingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ratingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideRating, RideRating, QDistinct> distinctByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stars');
    });
  }
}

extension RideRatingQueryProperty
    on QueryBuilder<RideRating, RideRating, QQueryProperty> {
  QueryBuilder<RideRating, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideRating, String, QQueryOperations> bookingUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingUuid');
    });
  }

  QueryBuilder<RideRating, String, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<RideRating, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideRating, String, QQueryOperations> driverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverUuid');
    });
  }

  QueryBuilder<RideRating, bool, QQueryOperations> isComplaintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isComplaint');
    });
  }

  QueryBuilder<RideRating, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<RideRating, String, QQueryOperations> passengerUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passengerUuid');
    });
  }

  QueryBuilder<RideRating, String, QQueryOperations> ratingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ratingId');
    });
  }

  QueryBuilder<RideRating, int, QQueryOperations> starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stars');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideChatMessageCollection on Isar {
  IsarCollection<RideChatMessage> get rideChatMessages => this.collection();
}

const RideChatMessageSchema = CollectionSchema(
  name: r'RideChatMessage',
  id: -6154855077247476119,
  properties: {
    r'bookingUuid': PropertySchema(
      id: 0,
      name: r'bookingUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'imageUrl': PropertySchema(
      id: 2,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'msgId': PropertySchema(
      id: 3,
      name: r'msgId',
      type: IsarType.string,
    ),
    r'readAt': PropertySchema(
      id: 4,
      name: r'readAt',
      type: IsarType.dateTime,
    ),
    r'senderRole': PropertySchema(
      id: 5,
      name: r'senderRole',
      type: IsarType.string,
    ),
    r'senderUuid': PropertySchema(
      id: 6,
      name: r'senderUuid',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 7,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _rideChatMessageEstimateSize,
  serialize: _rideChatMessageSerialize,
  deserialize: _rideChatMessageDeserialize,
  deserializeProp: _rideChatMessageDeserializeProp,
  idName: r'id',
  indexes: {
    r'msgId': IndexSchema(
      id: 8574845111581175867,
      name: r'msgId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'msgId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'bookingUuid': IndexSchema(
      id: 7512254276217561001,
      name: r'bookingUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookingUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideChatMessageGetId,
  getLinks: _rideChatMessageGetLinks,
  attach: _rideChatMessageAttach,
  version: '3.1.0+1',
);

int _rideChatMessageEstimateSize(
  RideChatMessage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookingUuid.length * 3;
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.msgId.length * 3;
  bytesCount += 3 + object.senderRole.length * 3;
  bytesCount += 3 + object.senderUuid.length * 3;
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _rideChatMessageSerialize(
  RideChatMessage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookingUuid);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.imageUrl);
  writer.writeString(offsets[3], object.msgId);
  writer.writeDateTime(offsets[4], object.readAt);
  writer.writeString(offsets[5], object.senderRole);
  writer.writeString(offsets[6], object.senderUuid);
  writer.writeString(offsets[7], object.text);
}

RideChatMessage _rideChatMessageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideChatMessage();
  object.bookingUuid = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[2]);
  object.msgId = reader.readString(offsets[3]);
  object.readAt = reader.readDateTimeOrNull(offsets[4]);
  object.senderRole = reader.readString(offsets[5]);
  object.senderUuid = reader.readString(offsets[6]);
  object.text = reader.readString(offsets[7]);
  return object;
}

P _rideChatMessageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideChatMessageGetId(RideChatMessage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideChatMessageGetLinks(RideChatMessage object) {
  return [];
}

void _rideChatMessageAttach(
    IsarCollection<dynamic> col, Id id, RideChatMessage object) {
  object.id = id;
}

extension RideChatMessageByIndex on IsarCollection<RideChatMessage> {
  Future<RideChatMessage?> getByMsgId(String msgId) {
    return getByIndex(r'msgId', [msgId]);
  }

  RideChatMessage? getByMsgIdSync(String msgId) {
    return getByIndexSync(r'msgId', [msgId]);
  }

  Future<bool> deleteByMsgId(String msgId) {
    return deleteByIndex(r'msgId', [msgId]);
  }

  bool deleteByMsgIdSync(String msgId) {
    return deleteByIndexSync(r'msgId', [msgId]);
  }

  Future<List<RideChatMessage?>> getAllByMsgId(List<String> msgIdValues) {
    final values = msgIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'msgId', values);
  }

  List<RideChatMessage?> getAllByMsgIdSync(List<String> msgIdValues) {
    final values = msgIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'msgId', values);
  }

  Future<int> deleteAllByMsgId(List<String> msgIdValues) {
    final values = msgIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'msgId', values);
  }

  int deleteAllByMsgIdSync(List<String> msgIdValues) {
    final values = msgIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'msgId', values);
  }

  Future<Id> putByMsgId(RideChatMessage object) {
    return putByIndex(r'msgId', object);
  }

  Id putByMsgIdSync(RideChatMessage object, {bool saveLinks = true}) {
    return putByIndexSync(r'msgId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMsgId(List<RideChatMessage> objects) {
    return putAllByIndex(r'msgId', objects);
  }

  List<Id> putAllByMsgIdSync(List<RideChatMessage> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'msgId', objects, saveLinks: saveLinks);
  }
}

extension RideChatMessageQueryWhereSort
    on QueryBuilder<RideChatMessage, RideChatMessage, QWhere> {
  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideChatMessageQueryWhere
    on QueryBuilder<RideChatMessage, RideChatMessage, QWhereClause> {
  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause>
      msgIdEqualTo(String msgId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'msgId',
        value: [msgId],
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause>
      msgIdNotEqualTo(String msgId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'msgId',
              lower: [],
              upper: [msgId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'msgId',
              lower: [msgId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'msgId',
              lower: [msgId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'msgId',
              lower: [],
              upper: [msgId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause>
      bookingUuidEqualTo(String bookingUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookingUuid',
        value: [bookingUuid],
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterWhereClause>
      bookingUuidNotEqualTo(String bookingUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [],
              upper: [bookingUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [bookingUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [bookingUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [],
              upper: [bookingUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideChatMessageQueryFilter
    on QueryBuilder<RideChatMessage, RideChatMessage, QFilterCondition> {
  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      bookingUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
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

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'msgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'msgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'msgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'msgId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'msgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'msgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'msgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'msgId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'msgId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      msgIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'msgId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      readAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'readAt',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      readAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'readAt',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      readAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      readAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      readAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      readAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderRole',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderRole',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderRole',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderRole',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderRoleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderRole',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      senderUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension RideChatMessageQueryObject
    on QueryBuilder<RideChatMessage, RideChatMessage, QFilterCondition> {}

extension RideChatMessageQueryLinks
    on QueryBuilder<RideChatMessage, RideChatMessage, QFilterCondition> {}

extension RideChatMessageQuerySortBy
    on QueryBuilder<RideChatMessage, RideChatMessage, QSortBy> {
  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> sortByMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgId', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgId', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> sortByReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortBySenderRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderRole', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortBySenderRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderRole', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortBySenderUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortBySenderUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension RideChatMessageQuerySortThenBy
    on QueryBuilder<RideChatMessage, RideChatMessage, QSortThenBy> {
  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> thenByMsgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgId', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByMsgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgId', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> thenByReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByReadAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readAt', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenBySenderRole() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderRole', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenBySenderRoleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderRole', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenBySenderUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenBySenderUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderUuid', Sort.desc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension RideChatMessageQueryWhereDistinct
    on QueryBuilder<RideChatMessage, RideChatMessage, QDistinct> {
  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct>
      distinctByBookingUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct> distinctByMsgId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'msgId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct> distinctByReadAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readAt');
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct>
      distinctBySenderRole({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderRole', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct>
      distinctBySenderUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideChatMessage, RideChatMessage, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension RideChatMessageQueryProperty
    on QueryBuilder<RideChatMessage, RideChatMessage, QQueryProperty> {
  QueryBuilder<RideChatMessage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideChatMessage, String, QQueryOperations>
      bookingUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingUuid');
    });
  }

  QueryBuilder<RideChatMessage, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideChatMessage, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<RideChatMessage, String, QQueryOperations> msgIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'msgId');
    });
  }

  QueryBuilder<RideChatMessage, DateTime?, QQueryOperations> readAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readAt');
    });
  }

  QueryBuilder<RideChatMessage, String, QQueryOperations> senderRoleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderRole');
    });
  }

  QueryBuilder<RideChatMessage, String, QQueryOperations> senderUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderUuid');
    });
  }

  QueryBuilder<RideChatMessage, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideMaskedCallCollection on Isar {
  IsarCollection<RideMaskedCall> get rideMaskedCalls => this.collection();
}

const RideMaskedCallSchema = CollectionSchema(
  name: r'RideMaskedCall',
  id: 1985029847232615948,
  properties: {
    r'bookingUuid': PropertySchema(
      id: 0,
      name: r'bookingUuid',
      type: IsarType.string,
    ),
    r'callId': PropertySchema(
      id: 1,
      name: r'callId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'driverReal': PropertySchema(
      id: 3,
      name: r'driverReal',
      type: IsarType.string,
    ),
    r'expiresAt': PropertySchema(
      id: 4,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'passengerReal': PropertySchema(
      id: 5,
      name: r'passengerReal',
      type: IsarType.string,
    ),
    r'virtualNumber': PropertySchema(
      id: 6,
      name: r'virtualNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _rideMaskedCallEstimateSize,
  serialize: _rideMaskedCallSerialize,
  deserialize: _rideMaskedCallDeserialize,
  deserializeProp: _rideMaskedCallDeserializeProp,
  idName: r'id',
  indexes: {
    r'callId': IndexSchema(
      id: 7116320153300369584,
      name: r'callId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'callId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'bookingUuid': IndexSchema(
      id: 7512254276217561001,
      name: r'bookingUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bookingUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideMaskedCallGetId,
  getLinks: _rideMaskedCallGetLinks,
  attach: _rideMaskedCallAttach,
  version: '3.1.0+1',
);

int _rideMaskedCallEstimateSize(
  RideMaskedCall object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bookingUuid.length * 3;
  bytesCount += 3 + object.callId.length * 3;
  bytesCount += 3 + object.driverReal.length * 3;
  bytesCount += 3 + object.passengerReal.length * 3;
  bytesCount += 3 + object.virtualNumber.length * 3;
  return bytesCount;
}

void _rideMaskedCallSerialize(
  RideMaskedCall object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookingUuid);
  writer.writeString(offsets[1], object.callId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.driverReal);
  writer.writeDateTime(offsets[4], object.expiresAt);
  writer.writeString(offsets[5], object.passengerReal);
  writer.writeString(offsets[6], object.virtualNumber);
}

RideMaskedCall _rideMaskedCallDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideMaskedCall();
  object.bookingUuid = reader.readString(offsets[0]);
  object.callId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.driverReal = reader.readString(offsets[3]);
  object.expiresAt = reader.readDateTime(offsets[4]);
  object.id = id;
  object.passengerReal = reader.readString(offsets[5]);
  object.virtualNumber = reader.readString(offsets[6]);
  return object;
}

P _rideMaskedCallDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideMaskedCallGetId(RideMaskedCall object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideMaskedCallGetLinks(RideMaskedCall object) {
  return [];
}

void _rideMaskedCallAttach(
    IsarCollection<dynamic> col, Id id, RideMaskedCall object) {
  object.id = id;
}

extension RideMaskedCallByIndex on IsarCollection<RideMaskedCall> {
  Future<RideMaskedCall?> getByCallId(String callId) {
    return getByIndex(r'callId', [callId]);
  }

  RideMaskedCall? getByCallIdSync(String callId) {
    return getByIndexSync(r'callId', [callId]);
  }

  Future<bool> deleteByCallId(String callId) {
    return deleteByIndex(r'callId', [callId]);
  }

  bool deleteByCallIdSync(String callId) {
    return deleteByIndexSync(r'callId', [callId]);
  }

  Future<List<RideMaskedCall?>> getAllByCallId(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'callId', values);
  }

  List<RideMaskedCall?> getAllByCallIdSync(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'callId', values);
  }

  Future<int> deleteAllByCallId(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'callId', values);
  }

  int deleteAllByCallIdSync(List<String> callIdValues) {
    final values = callIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'callId', values);
  }

  Future<Id> putByCallId(RideMaskedCall object) {
    return putByIndex(r'callId', object);
  }

  Id putByCallIdSync(RideMaskedCall object, {bool saveLinks = true}) {
    return putByIndexSync(r'callId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCallId(List<RideMaskedCall> objects) {
    return putAllByIndex(r'callId', objects);
  }

  List<Id> putAllByCallIdSync(List<RideMaskedCall> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'callId', objects, saveLinks: saveLinks);
  }
}

extension RideMaskedCallQueryWhereSort
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QWhere> {
  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideMaskedCallQueryWhere
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QWhereClause> {
  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause> callIdEqualTo(
      String callId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'callId',
        value: [callId],
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause>
      callIdNotEqualTo(String callId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [],
              upper: [callId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [callId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [callId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'callId',
              lower: [],
              upper: [callId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause>
      bookingUuidEqualTo(String bookingUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bookingUuid',
        value: [bookingUuid],
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterWhereClause>
      bookingUuidNotEqualTo(String bookingUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [],
              upper: [bookingUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [bookingUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [bookingUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bookingUuid',
              lower: [],
              upper: [bookingUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideMaskedCallQueryFilter
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QFilterCondition> {
  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      bookingUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'callId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'callId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'callId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'callId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      callIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'callId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverReal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverReal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverReal',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      driverRealIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverReal',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      expiresAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      expiresAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      expiresAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      expiresAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'passengerReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'passengerReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'passengerReal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'passengerReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'passengerReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'passengerReal',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'passengerReal',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'passengerReal',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      passengerRealIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'passengerReal',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'virtualNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'virtualNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'virtualNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'virtualNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'virtualNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'virtualNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'virtualNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'virtualNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'virtualNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterFilterCondition>
      virtualNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'virtualNumber',
        value: '',
      ));
    });
  }
}

extension RideMaskedCallQueryObject
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QFilterCondition> {}

extension RideMaskedCallQueryLinks
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QFilterCondition> {}

extension RideMaskedCallQuerySortBy
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QSortBy> {
  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> sortByCallId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByCallIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByDriverReal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverReal', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByDriverRealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverReal', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByPassengerReal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerReal', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByPassengerRealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerReal', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByVirtualNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'virtualNumber', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      sortByVirtualNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'virtualNumber', Sort.desc);
    });
  }
}

extension RideMaskedCallQuerySortThenBy
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QSortThenBy> {
  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> thenByCallId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByCallIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'callId', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByDriverReal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverReal', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByDriverRealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverReal', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByPassengerReal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerReal', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByPassengerRealDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'passengerReal', Sort.desc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByVirtualNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'virtualNumber', Sort.asc);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QAfterSortBy>
      thenByVirtualNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'virtualNumber', Sort.desc);
    });
  }
}

extension RideMaskedCallQueryWhereDistinct
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct> {
  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct> distinctByBookingUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct> distinctByCallId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'callId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct> distinctByDriverReal(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverReal', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct>
      distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct>
      distinctByPassengerReal({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'passengerReal',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideMaskedCall, RideMaskedCall, QDistinct>
      distinctByVirtualNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'virtualNumber',
          caseSensitive: caseSensitive);
    });
  }
}

extension RideMaskedCallQueryProperty
    on QueryBuilder<RideMaskedCall, RideMaskedCall, QQueryProperty> {
  QueryBuilder<RideMaskedCall, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideMaskedCall, String, QQueryOperations> bookingUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingUuid');
    });
  }

  QueryBuilder<RideMaskedCall, String, QQueryOperations> callIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'callId');
    });
  }

  QueryBuilder<RideMaskedCall, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideMaskedCall, String, QQueryOperations> driverRealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverReal');
    });
  }

  QueryBuilder<RideMaskedCall, DateTime, QQueryOperations> expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<RideMaskedCall, String, QQueryOperations>
      passengerRealProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'passengerReal');
    });
  }

  QueryBuilder<RideMaskedCall, String, QQueryOperations>
      virtualNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'virtualNumber');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideNotificationCollection on Isar {
  IsarCollection<RideNotification> get rideNotifications => this.collection();
}

const RideNotificationSchema = CollectionSchema(
  name: r'RideNotification',
  id: 5437411296670866977,
  properties: {
    r'body': PropertySchema(
      id: 0,
      name: r'body',
      type: IsarType.string,
    ),
    r'channel': PropertySchema(
      id: 1,
      name: r'channel',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'isRead': PropertySchema(
      id: 3,
      name: r'isRead',
      type: IsarType.bool,
    ),
    r'notifId': PropertySchema(
      id: 4,
      name: r'notifId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 5,
      name: r'title',
      type: IsarType.string,
    ),
    r'userUuid': PropertySchema(
      id: 6,
      name: r'userUuid',
      type: IsarType.string,
    )
  },
  estimateSize: _rideNotificationEstimateSize,
  serialize: _rideNotificationSerialize,
  deserialize: _rideNotificationDeserialize,
  deserializeProp: _rideNotificationDeserializeProp,
  idName: r'id',
  indexes: {
    r'notifId': IndexSchema(
      id: 3816694177820424078,
      name: r'notifId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'notifId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userUuid': IndexSchema(
      id: -2441299026227353304,
      name: r'userUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideNotificationGetId,
  getLinks: _rideNotificationGetLinks,
  attach: _rideNotificationAttach,
  version: '3.1.0+1',
);

int _rideNotificationEstimateSize(
  RideNotification object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.body.length * 3;
  bytesCount += 3 + object.channel.length * 3;
  bytesCount += 3 + object.notifId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.userUuid.length * 3;
  return bytesCount;
}

void _rideNotificationSerialize(
  RideNotification object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.body);
  writer.writeString(offsets[1], object.channel);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeBool(offsets[3], object.isRead);
  writer.writeString(offsets[4], object.notifId);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.userUuid);
}

RideNotification _rideNotificationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideNotification();
  object.body = reader.readString(offsets[0]);
  object.channel = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.isRead = reader.readBool(offsets[3]);
  object.notifId = reader.readString(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.userUuid = reader.readString(offsets[6]);
  return object;
}

P _rideNotificationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideNotificationGetId(RideNotification object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideNotificationGetLinks(RideNotification object) {
  return [];
}

void _rideNotificationAttach(
    IsarCollection<dynamic> col, Id id, RideNotification object) {
  object.id = id;
}

extension RideNotificationByIndex on IsarCollection<RideNotification> {
  Future<RideNotification?> getByNotifId(String notifId) {
    return getByIndex(r'notifId', [notifId]);
  }

  RideNotification? getByNotifIdSync(String notifId) {
    return getByIndexSync(r'notifId', [notifId]);
  }

  Future<bool> deleteByNotifId(String notifId) {
    return deleteByIndex(r'notifId', [notifId]);
  }

  bool deleteByNotifIdSync(String notifId) {
    return deleteByIndexSync(r'notifId', [notifId]);
  }

  Future<List<RideNotification?>> getAllByNotifId(List<String> notifIdValues) {
    final values = notifIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'notifId', values);
  }

  List<RideNotification?> getAllByNotifIdSync(List<String> notifIdValues) {
    final values = notifIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'notifId', values);
  }

  Future<int> deleteAllByNotifId(List<String> notifIdValues) {
    final values = notifIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'notifId', values);
  }

  int deleteAllByNotifIdSync(List<String> notifIdValues) {
    final values = notifIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'notifId', values);
  }

  Future<Id> putByNotifId(RideNotification object) {
    return putByIndex(r'notifId', object);
  }

  Id putByNotifIdSync(RideNotification object, {bool saveLinks = true}) {
    return putByIndexSync(r'notifId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNotifId(List<RideNotification> objects) {
    return putAllByIndex(r'notifId', objects);
  }

  List<Id> putAllByNotifIdSync(List<RideNotification> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'notifId', objects, saveLinks: saveLinks);
  }
}

extension RideNotificationQueryWhereSort
    on QueryBuilder<RideNotification, RideNotification, QWhere> {
  QueryBuilder<RideNotification, RideNotification, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideNotificationQueryWhere
    on QueryBuilder<RideNotification, RideNotification, QWhereClause> {
  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
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

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
      notifIdEqualTo(String notifId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'notifId',
        value: [notifId],
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
      notifIdNotEqualTo(String notifId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notifId',
              lower: [],
              upper: [notifId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notifId',
              lower: [notifId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notifId',
              lower: [notifId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'notifId',
              lower: [],
              upper: [notifId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
      userUuidEqualTo(String userUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userUuid',
        value: [userUuid],
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterWhereClause>
      userUuidNotEqualTo(String userUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [],
              upper: [userUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [userUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [userUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [],
              upper: [userUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideNotificationQueryFilter
    on QueryBuilder<RideNotification, RideNotification, QFilterCondition> {
  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'body',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'body',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'body',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'body',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'channel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'channel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'channel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'channel',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      channelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'channel',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
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

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
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

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
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

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
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

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
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

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
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

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      isReadEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isRead',
        value: value,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notifId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notifId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notifId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notifId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notifId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notifId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notifId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      notifIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notifId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterFilterCondition>
      userUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userUuid',
        value: '',
      ));
    });
  }
}

extension RideNotificationQueryObject
    on QueryBuilder<RideNotification, RideNotification, QFilterCondition> {}

extension RideNotificationQueryLinks
    on QueryBuilder<RideNotification, RideNotification, QFilterCondition> {}

extension RideNotificationQuerySortBy
    on QueryBuilder<RideNotification, RideNotification, QSortBy> {
  QueryBuilder<RideNotification, RideNotification, QAfterSortBy> sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByNotifId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByNotifIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      sortByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension RideNotificationQuerySortThenBy
    on QueryBuilder<RideNotification, RideNotification, QSortThenBy> {
  QueryBuilder<RideNotification, RideNotification, QAfterSortBy> thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByChannel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByChannelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'channel', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByIsReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isRead', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByNotifId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByNotifIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QAfterSortBy>
      thenByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension RideNotificationQueryWhereDistinct
    on QueryBuilder<RideNotification, RideNotification, QDistinct> {
  QueryBuilder<RideNotification, RideNotification, QDistinct> distinctByBody(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QDistinct> distinctByChannel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'channel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideNotification, RideNotification, QDistinct>
      distinctByIsRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isRead');
    });
  }

  QueryBuilder<RideNotification, RideNotification, QDistinct> distinctByNotifId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideNotification, RideNotification, QDistinct>
      distinctByUserUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUuid', caseSensitive: caseSensitive);
    });
  }
}

extension RideNotificationQueryProperty
    on QueryBuilder<RideNotification, RideNotification, QQueryProperty> {
  QueryBuilder<RideNotification, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideNotification, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<RideNotification, String, QQueryOperations> channelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'channel');
    });
  }

  QueryBuilder<RideNotification, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideNotification, bool, QQueryOperations> isReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isRead');
    });
  }

  QueryBuilder<RideNotification, String, QQueryOperations> notifIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifId');
    });
  }

  QueryBuilder<RideNotification, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<RideNotification, String, QQueryOperations> userUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideGeoFenceCollection on Isar {
  IsarCollection<RideGeoFence> get rideGeoFences => this.collection();
}

const RideGeoFenceSchema = CollectionSchema(
  name: r'RideGeoFence',
  id: -4285496511608982260,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'centerLat': PropertySchema(
      id: 1,
      name: r'centerLat',
      type: IsarType.double,
    ),
    r'centerLng': PropertySchema(
      id: 2,
      name: r'centerLng',
      type: IsarType.double,
    ),
    r'fenceId': PropertySchema(
      id: 3,
      name: r'fenceId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'province': PropertySchema(
      id: 6,
      name: r'province',
      type: IsarType.string,
    ),
    r'radiusKm': PropertySchema(
      id: 7,
      name: r'radiusKm',
      type: IsarType.double,
    )
  },
  estimateSize: _rideGeoFenceEstimateSize,
  serialize: _rideGeoFenceSerialize,
  deserialize: _rideGeoFenceDeserialize,
  deserializeProp: _rideGeoFenceDeserializeProp,
  idName: r'id',
  indexes: {
    r'fenceId': IndexSchema(
      id: 4802919287729766805,
      name: r'fenceId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'fenceId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideGeoFenceGetId,
  getLinks: _rideGeoFenceGetLinks,
  attach: _rideGeoFenceAttach,
  version: '3.1.0+1',
);

int _rideGeoFenceEstimateSize(
  RideGeoFence object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fenceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.province.length * 3;
  return bytesCount;
}

void _rideGeoFenceSerialize(
  RideGeoFence object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeDouble(offsets[1], object.centerLat);
  writer.writeDouble(offsets[2], object.centerLng);
  writer.writeString(offsets[3], object.fenceId);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.province);
  writer.writeDouble(offsets[7], object.radiusKm);
}

RideGeoFence _rideGeoFenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideGeoFence();
  object.active = reader.readBool(offsets[0]);
  object.centerLat = reader.readDouble(offsets[1]);
  object.centerLng = reader.readDouble(offsets[2]);
  object.fenceId = reader.readString(offsets[3]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.province = reader.readString(offsets[6]);
  object.radiusKm = reader.readDouble(offsets[7]);
  return object;
}

P _rideGeoFenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideGeoFenceGetId(RideGeoFence object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideGeoFenceGetLinks(RideGeoFence object) {
  return [];
}

void _rideGeoFenceAttach(
    IsarCollection<dynamic> col, Id id, RideGeoFence object) {
  object.id = id;
}

extension RideGeoFenceByIndex on IsarCollection<RideGeoFence> {
  Future<RideGeoFence?> getByFenceId(String fenceId) {
    return getByIndex(r'fenceId', [fenceId]);
  }

  RideGeoFence? getByFenceIdSync(String fenceId) {
    return getByIndexSync(r'fenceId', [fenceId]);
  }

  Future<bool> deleteByFenceId(String fenceId) {
    return deleteByIndex(r'fenceId', [fenceId]);
  }

  bool deleteByFenceIdSync(String fenceId) {
    return deleteByIndexSync(r'fenceId', [fenceId]);
  }

  Future<List<RideGeoFence?>> getAllByFenceId(List<String> fenceIdValues) {
    final values = fenceIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'fenceId', values);
  }

  List<RideGeoFence?> getAllByFenceIdSync(List<String> fenceIdValues) {
    final values = fenceIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'fenceId', values);
  }

  Future<int> deleteAllByFenceId(List<String> fenceIdValues) {
    final values = fenceIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'fenceId', values);
  }

  int deleteAllByFenceIdSync(List<String> fenceIdValues) {
    final values = fenceIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'fenceId', values);
  }

  Future<Id> putByFenceId(RideGeoFence object) {
    return putByIndex(r'fenceId', object);
  }

  Id putByFenceIdSync(RideGeoFence object, {bool saveLinks = true}) {
    return putByIndexSync(r'fenceId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFenceId(List<RideGeoFence> objects) {
    return putAllByIndex(r'fenceId', objects);
  }

  List<Id> putAllByFenceIdSync(List<RideGeoFence> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'fenceId', objects, saveLinks: saveLinks);
  }
}

extension RideGeoFenceQueryWhereSort
    on QueryBuilder<RideGeoFence, RideGeoFence, QWhere> {
  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideGeoFenceQueryWhere
    on QueryBuilder<RideGeoFence, RideGeoFence, QWhereClause> {
  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> fenceIdEqualTo(
      String fenceId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fenceId',
        value: [fenceId],
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterWhereClause> fenceIdNotEqualTo(
      String fenceId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fenceId',
              lower: [],
              upper: [fenceId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fenceId',
              lower: [fenceId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fenceId',
              lower: [fenceId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fenceId',
              lower: [],
              upper: [fenceId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideGeoFenceQueryFilter
    on QueryBuilder<RideGeoFence, RideGeoFence, QFilterCondition> {
  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> activeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'centerLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'centerLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'centerLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'centerLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'centerLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'centerLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      centerLngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'centerLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      fenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> nameContains(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'province',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'province',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'province',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      provinceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'province',
        value: '',
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      radiusKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'radiusKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      radiusKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'radiusKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      radiusKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'radiusKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterFilterCondition>
      radiusKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'radiusKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RideGeoFenceQueryObject
    on QueryBuilder<RideGeoFence, RideGeoFence, QFilterCondition> {}

extension RideGeoFenceQueryLinks
    on QueryBuilder<RideGeoFence, RideGeoFence, QFilterCondition> {}

extension RideGeoFenceQuerySortBy
    on QueryBuilder<RideGeoFence, RideGeoFence, QSortBy> {
  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByCenterLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLat', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByCenterLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLat', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByCenterLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLng', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByCenterLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLng', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByFenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fenceId', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByFenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fenceId', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByRadiusKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radiusKm', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> sortByRadiusKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radiusKm', Sort.desc);
    });
  }
}

extension RideGeoFenceQuerySortThenBy
    on QueryBuilder<RideGeoFence, RideGeoFence, QSortThenBy> {
  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByCenterLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLat', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByCenterLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLat', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByCenterLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLng', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByCenterLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'centerLng', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByFenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fenceId', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByFenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fenceId', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByProvince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByProvinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'province', Sort.desc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByRadiusKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radiusKm', Sort.asc);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QAfterSortBy> thenByRadiusKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'radiusKm', Sort.desc);
    });
  }
}

extension RideGeoFenceQueryWhereDistinct
    on QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> {
  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByCenterLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerLat');
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByCenterLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'centerLng');
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByFenceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fenceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByProvince(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'province', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideGeoFence, RideGeoFence, QDistinct> distinctByRadiusKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'radiusKm');
    });
  }
}

extension RideGeoFenceQueryProperty
    on QueryBuilder<RideGeoFence, RideGeoFence, QQueryProperty> {
  QueryBuilder<RideGeoFence, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideGeoFence, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<RideGeoFence, double, QQueryOperations> centerLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerLat');
    });
  }

  QueryBuilder<RideGeoFence, double, QQueryOperations> centerLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'centerLng');
    });
  }

  QueryBuilder<RideGeoFence, String, QQueryOperations> fenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fenceId');
    });
  }

  QueryBuilder<RideGeoFence, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<RideGeoFence, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RideGeoFence, String, QQueryOperations> provinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'province');
    });
  }

  QueryBuilder<RideGeoFence, double, QQueryOperations> radiusKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'radiusKm');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideSupportTicketCollection on Isar {
  IsarCollection<RideSupportTicket> get rideSupportTickets => this.collection();
}

const RideSupportTicketSchema = CollectionSchema(
  name: r'RideSupportTicket',
  id: 334982268502574596,
  properties: {
    r'bookingUuid': PropertySchema(
      id: 0,
      name: r'bookingUuid',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'detail': PropertySchema(
      id: 3,
      name: r'detail',
      type: IsarType.string,
    ),
    r'refundAmount': PropertySchema(
      id: 4,
      name: r'refundAmount',
      type: IsarType.double,
    ),
    r'resolvedAt': PropertySchema(
      id: 5,
      name: r'resolvedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.string,
    ),
    r'subject': PropertySchema(
      id: 7,
      name: r'subject',
      type: IsarType.string,
    ),
    r'ticketId': PropertySchema(
      id: 8,
      name: r'ticketId',
      type: IsarType.string,
    ),
    r'userUuid': PropertySchema(
      id: 9,
      name: r'userUuid',
      type: IsarType.string,
    )
  },
  estimateSize: _rideSupportTicketEstimateSize,
  serialize: _rideSupportTicketSerialize,
  deserialize: _rideSupportTicketDeserialize,
  deserializeProp: _rideSupportTicketDeserializeProp,
  idName: r'id',
  indexes: {
    r'ticketId': IndexSchema(
      id: -6483959237056329942,
      name: r'ticketId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'ticketId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userUuid': IndexSchema(
      id: -2441299026227353304,
      name: r'userUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideSupportTicketGetId,
  getLinks: _rideSupportTicketGetLinks,
  attach: _rideSupportTicketAttach,
  version: '3.1.0+1',
);

int _rideSupportTicketEstimateSize(
  RideSupportTicket object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bookingUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.detail.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.subject.length * 3;
  bytesCount += 3 + object.ticketId.length * 3;
  bytesCount += 3 + object.userUuid.length * 3;
  return bytesCount;
}

void _rideSupportTicketSerialize(
  RideSupportTicket object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookingUuid);
  writer.writeString(offsets[1], object.category);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.detail);
  writer.writeDouble(offsets[4], object.refundAmount);
  writer.writeDateTime(offsets[5], object.resolvedAt);
  writer.writeString(offsets[6], object.status);
  writer.writeString(offsets[7], object.subject);
  writer.writeString(offsets[8], object.ticketId);
  writer.writeString(offsets[9], object.userUuid);
}

RideSupportTicket _rideSupportTicketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideSupportTicket();
  object.bookingUuid = reader.readStringOrNull(offsets[0]);
  object.category = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.detail = reader.readString(offsets[3]);
  object.id = id;
  object.refundAmount = reader.readDouble(offsets[4]);
  object.resolvedAt = reader.readDateTimeOrNull(offsets[5]);
  object.status = reader.readString(offsets[6]);
  object.subject = reader.readString(offsets[7]);
  object.ticketId = reader.readString(offsets[8]);
  object.userUuid = reader.readString(offsets[9]);
  return object;
}

P _rideSupportTicketDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideSupportTicketGetId(RideSupportTicket object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideSupportTicketGetLinks(
    RideSupportTicket object) {
  return [];
}

void _rideSupportTicketAttach(
    IsarCollection<dynamic> col, Id id, RideSupportTicket object) {
  object.id = id;
}

extension RideSupportTicketByIndex on IsarCollection<RideSupportTicket> {
  Future<RideSupportTicket?> getByTicketId(String ticketId) {
    return getByIndex(r'ticketId', [ticketId]);
  }

  RideSupportTicket? getByTicketIdSync(String ticketId) {
    return getByIndexSync(r'ticketId', [ticketId]);
  }

  Future<bool> deleteByTicketId(String ticketId) {
    return deleteByIndex(r'ticketId', [ticketId]);
  }

  bool deleteByTicketIdSync(String ticketId) {
    return deleteByIndexSync(r'ticketId', [ticketId]);
  }

  Future<List<RideSupportTicket?>> getAllByTicketId(
      List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ticketId', values);
  }

  List<RideSupportTicket?> getAllByTicketIdSync(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'ticketId', values);
  }

  Future<int> deleteAllByTicketId(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'ticketId', values);
  }

  int deleteAllByTicketIdSync(List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'ticketId', values);
  }

  Future<Id> putByTicketId(RideSupportTicket object) {
    return putByIndex(r'ticketId', object);
  }

  Id putByTicketIdSync(RideSupportTicket object, {bool saveLinks = true}) {
    return putByIndexSync(r'ticketId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTicketId(List<RideSupportTicket> objects) {
    return putAllByIndex(r'ticketId', objects);
  }

  List<Id> putAllByTicketIdSync(List<RideSupportTicket> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ticketId', objects, saveLinks: saveLinks);
  }
}

extension RideSupportTicketQueryWhereSort
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QWhere> {
  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideSupportTicketQueryWhere
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QWhereClause> {
  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      ticketIdEqualTo(String ticketId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketId',
        value: [ticketId],
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      ticketIdNotEqualTo(String ticketId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [],
              upper: [ticketId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [ticketId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [ticketId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ticketId',
              lower: [],
              upper: [ticketId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      userUuidEqualTo(String userUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userUuid',
        value: [userUuid],
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterWhereClause>
      userUuidNotEqualTo(String userUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [],
              upper: [userUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [userUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [userUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userUuid',
              lower: [],
              upper: [userUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideSupportTicketQueryFilter
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QFilterCondition> {
  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookingUuid',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookingUuid',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookingUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookingUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookingUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      bookingUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookingUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      detailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      refundAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'refundAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      refundAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'refundAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      refundAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'refundAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      refundAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'refundAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      resolvedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resolvedAt',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      resolvedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resolvedAt',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      resolvedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      resolvedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      resolvedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      resolvedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusEqualTo(
    String value, {
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusLessThan(
    String value, {
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subject',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subject',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subject',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      subjectIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subject',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ticketId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      ticketIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterFilterCondition>
      userUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userUuid',
        value: '',
      ));
    });
  }
}

extension RideSupportTicketQueryObject
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QFilterCondition> {}

extension RideSupportTicketQueryLinks
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QFilterCondition> {}

extension RideSupportTicketQuerySortBy
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QSortBy> {
  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByRefundAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refundAmount', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByRefundAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refundAmount', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByResolvedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      sortByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension RideSupportTicketQuerySortThenBy
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QSortThenBy> {
  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByBookingUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByBookingUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookingUuid', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByRefundAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refundAmount', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByRefundAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refundAmount', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByResolvedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenBySubject() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenBySubjectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subject', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QAfterSortBy>
      thenByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension RideSupportTicketQueryWhereDistinct
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct> {
  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByBookingUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookingUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByDetail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByRefundAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refundAmount');
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedAt');
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctBySubject({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subject', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByTicketId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSupportTicket, RideSupportTicket, QDistinct>
      distinctByUserUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUuid', caseSensitive: caseSensitive);
    });
  }
}

extension RideSupportTicketQueryProperty
    on QueryBuilder<RideSupportTicket, RideSupportTicket, QQueryProperty> {
  QueryBuilder<RideSupportTicket, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideSupportTicket, String?, QQueryOperations>
      bookingUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookingUuid');
    });
  }

  QueryBuilder<RideSupportTicket, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<RideSupportTicket, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideSupportTicket, String, QQueryOperations> detailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detail');
    });
  }

  QueryBuilder<RideSupportTicket, double, QQueryOperations>
      refundAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refundAmount');
    });
  }

  QueryBuilder<RideSupportTicket, DateTime?, QQueryOperations>
      resolvedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedAt');
    });
  }

  QueryBuilder<RideSupportTicket, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RideSupportTicket, String, QQueryOperations> subjectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subject');
    });
  }

  QueryBuilder<RideSupportTicket, String, QQueryOperations> ticketIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketId');
    });
  }

  QueryBuilder<RideSupportTicket, String, QQueryOperations> userUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUuid');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideAuditLogCollection on Isar {
  IsarCollection<RideAuditLog> get rideAuditLogs => this.collection();
}

const RideAuditLogSchema = CollectionSchema(
  name: r'RideAuditLog',
  id: 2435300455904400710,
  properties: {
    r'action': PropertySchema(
      id: 0,
      name: r'action',
      type: IsarType.string,
    ),
    r'actorUuid': PropertySchema(
      id: 1,
      name: r'actorUuid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'detail': PropertySchema(
      id: 3,
      name: r'detail',
      type: IsarType.string,
    )
  },
  estimateSize: _rideAuditLogEstimateSize,
  serialize: _rideAuditLogSerialize,
  deserialize: _rideAuditLogDeserialize,
  deserializeProp: _rideAuditLogDeserializeProp,
  idName: r'id',
  indexes: {
    r'action': IndexSchema(
      id: -2948318935682215514,
      name: r'action',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'action',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideAuditLogGetId,
  getLinks: _rideAuditLogGetLinks,
  attach: _rideAuditLogAttach,
  version: '3.1.0+1',
);

int _rideAuditLogEstimateSize(
  RideAuditLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.action.length * 3;
  bytesCount += 3 + object.actorUuid.length * 3;
  bytesCount += 3 + object.detail.length * 3;
  return bytesCount;
}

void _rideAuditLogSerialize(
  RideAuditLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.action);
  writer.writeString(offsets[1], object.actorUuid);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.detail);
}

RideAuditLog _rideAuditLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideAuditLog();
  object.action = reader.readString(offsets[0]);
  object.actorUuid = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.detail = reader.readString(offsets[3]);
  object.id = id;
  return object;
}

P _rideAuditLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideAuditLogGetId(RideAuditLog object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideAuditLogGetLinks(RideAuditLog object) {
  return [];
}

void _rideAuditLogAttach(
    IsarCollection<dynamic> col, Id id, RideAuditLog object) {
  object.id = id;
}

extension RideAuditLogQueryWhereSort
    on QueryBuilder<RideAuditLog, RideAuditLog, QWhere> {
  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension RideAuditLogQueryWhere
    on QueryBuilder<RideAuditLog, RideAuditLog, QWhereClause> {
  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> idBetween(
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> actionEqualTo(
      String action) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'action',
        value: [action],
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> actionNotEqualTo(
      String action) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [],
              upper: [action],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [action],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [action],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'action',
              lower: [],
              upper: [action],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> createdAtEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RideAuditLogQueryFilter
    on QueryBuilder<RideAuditLog, RideAuditLog, QFilterCondition> {
  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> actionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> actionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'action',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'action',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> actionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'action',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'action',
        value: '',
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actorUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'actorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'actorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'actorUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'actorUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actorUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      actorUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'actorUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> detailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> detailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> detailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition>
      detailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detail',
        value: '',
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterFilterCondition> idBetween(
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
}

extension RideAuditLogQueryObject
    on QueryBuilder<RideAuditLog, RideAuditLog, QFilterCondition> {}

extension RideAuditLogQueryLinks
    on QueryBuilder<RideAuditLog, RideAuditLog, QFilterCondition> {}

extension RideAuditLogQuerySortBy
    on QueryBuilder<RideAuditLog, RideAuditLog, QSortBy> {
  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByActorUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorUuid', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByActorUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorUuid', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> sortByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }
}

extension RideAuditLogQuerySortThenBy
    on QueryBuilder<RideAuditLog, RideAuditLog, QSortThenBy> {
  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByAction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByActionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'action', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByActorUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorUuid', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByActorUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actorUuid', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByDetail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByDetailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'detail', Sort.desc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension RideAuditLogQueryWhereDistinct
    on QueryBuilder<RideAuditLog, RideAuditLog, QDistinct> {
  QueryBuilder<RideAuditLog, RideAuditLog, QDistinct> distinctByAction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'action', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QDistinct> distinctByActorUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actorUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideAuditLog, RideAuditLog, QDistinct> distinctByDetail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'detail', caseSensitive: caseSensitive);
    });
  }
}

extension RideAuditLogQueryProperty
    on QueryBuilder<RideAuditLog, RideAuditLog, QQueryProperty> {
  QueryBuilder<RideAuditLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideAuditLog, String, QQueryOperations> actionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'action');
    });
  }

  QueryBuilder<RideAuditLog, String, QQueryOperations> actorUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actorUuid');
    });
  }

  QueryBuilder<RideAuditLog, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideAuditLog, String, QQueryOperations> detailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'detail');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideSelfDriveRentalCollection on Isar {
  IsarCollection<RideSelfDriveRental> get rideSelfDriveRentals =>
      this.collection();
}

const RideSelfDriveRentalSchema = CollectionSchema(
  name: r'RideSelfDriveRental',
  id: 1793809946683868570,
  properties: {
    r'actualReturnTime': PropertySchema(
      id: 0,
      name: r'actualReturnTime',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerCccd': PropertySchema(
      id: 2,
      name: r'customerCccd',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 3,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 4,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'dailyPrice': PropertySchema(
      id: 5,
      name: r'dailyPrice',
      type: IsarType.double,
    ),
    r'deposit': PropertySchema(
      id: 6,
      name: r'deposit',
      type: IsarType.double,
    ),
    r'endDate': PropertySchema(
      id: 7,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'rentalId': PropertySchema(
      id: 8,
      name: r'rentalId',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 9,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
    ),
    r'vehiclePlate': PropertySchema(
      id: 11,
      name: r'vehiclePlate',
      type: IsarType.string,
    ),
    r'vehicleType': PropertySchema(
      id: 12,
      name: r'vehicleType',
      type: IsarType.byte,
      enumMap: _RideSelfDriveRentalvehicleTypeEnumValueMap,
    )
  },
  estimateSize: _rideSelfDriveRentalEstimateSize,
  serialize: _rideSelfDriveRentalSerialize,
  deserialize: _rideSelfDriveRentalDeserialize,
  deserializeProp: _rideSelfDriveRentalDeserializeProp,
  idName: r'id',
  indexes: {
    r'rentalId': IndexSchema(
      id: -1174179388413758664,
      name: r'rentalId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'rentalId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideSelfDriveRentalGetId,
  getLinks: _rideSelfDriveRentalGetLinks,
  attach: _rideSelfDriveRentalAttach,
  version: '3.1.0+1',
);

int _rideSelfDriveRentalEstimateSize(
  RideSelfDriveRental object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerCccd.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.rentalId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.vehiclePlate.length * 3;
  return bytesCount;
}

void _rideSelfDriveRentalSerialize(
  RideSelfDriveRental object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualReturnTime);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.customerCccd);
  writer.writeString(offsets[3], object.customerName);
  writer.writeString(offsets[4], object.customerPhone);
  writer.writeDouble(offsets[5], object.dailyPrice);
  writer.writeDouble(offsets[6], object.deposit);
  writer.writeDateTime(offsets[7], object.endDate);
  writer.writeString(offsets[8], object.rentalId);
  writer.writeDateTime(offsets[9], object.startDate);
  writer.writeString(offsets[10], object.status);
  writer.writeString(offsets[11], object.vehiclePlate);
  writer.writeByte(offsets[12], object.vehicleType.index);
}

RideSelfDriveRental _rideSelfDriveRentalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideSelfDriveRental();
  object.actualReturnTime = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.customerCccd = reader.readString(offsets[2]);
  object.customerName = reader.readString(offsets[3]);
  object.customerPhone = reader.readString(offsets[4]);
  object.dailyPrice = reader.readDouble(offsets[5]);
  object.deposit = reader.readDouble(offsets[6]);
  object.endDate = reader.readDateTime(offsets[7]);
  object.id = id;
  object.rentalId = reader.readString(offsets[8]);
  object.startDate = reader.readDateTime(offsets[9]);
  object.status = reader.readString(offsets[10]);
  object.vehiclePlate = reader.readString(offsets[11]);
  object.vehicleType = _RideSelfDriveRentalvehicleTypeValueEnumMap[
          reader.readByteOrNull(offsets[12])] ??
      VehicleType.motorBike;
  return object;
}

P _rideSelfDriveRentalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (_RideSelfDriveRentalvehicleTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          VehicleType.motorBike) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RideSelfDriveRentalvehicleTypeEnumValueMap = {
  'motorBike': 0,
  'evBike': 1,
  'car4Seats': 2,
  'car7Seats': 3,
  'delivery': 4,
};
const _RideSelfDriveRentalvehicleTypeValueEnumMap = {
  0: VehicleType.motorBike,
  1: VehicleType.evBike,
  2: VehicleType.car4Seats,
  3: VehicleType.car7Seats,
  4: VehicleType.delivery,
};

Id _rideSelfDriveRentalGetId(RideSelfDriveRental object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideSelfDriveRentalGetLinks(
    RideSelfDriveRental object) {
  return [];
}

void _rideSelfDriveRentalAttach(
    IsarCollection<dynamic> col, Id id, RideSelfDriveRental object) {
  object.id = id;
}

extension RideSelfDriveRentalByIndex on IsarCollection<RideSelfDriveRental> {
  Future<RideSelfDriveRental?> getByRentalId(String rentalId) {
    return getByIndex(r'rentalId', [rentalId]);
  }

  RideSelfDriveRental? getByRentalIdSync(String rentalId) {
    return getByIndexSync(r'rentalId', [rentalId]);
  }

  Future<bool> deleteByRentalId(String rentalId) {
    return deleteByIndex(r'rentalId', [rentalId]);
  }

  bool deleteByRentalIdSync(String rentalId) {
    return deleteByIndexSync(r'rentalId', [rentalId]);
  }

  Future<List<RideSelfDriveRental?>> getAllByRentalId(
      List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'rentalId', values);
  }

  List<RideSelfDriveRental?> getAllByRentalIdSync(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'rentalId', values);
  }

  Future<int> deleteAllByRentalId(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'rentalId', values);
  }

  int deleteAllByRentalIdSync(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'rentalId', values);
  }

  Future<Id> putByRentalId(RideSelfDriveRental object) {
    return putByIndex(r'rentalId', object);
  }

  Id putByRentalIdSync(RideSelfDriveRental object, {bool saveLinks = true}) {
    return putByIndexSync(r'rentalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRentalId(List<RideSelfDriveRental> objects) {
    return putAllByIndex(r'rentalId', objects);
  }

  List<Id> putAllByRentalIdSync(List<RideSelfDriveRental> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'rentalId', objects, saveLinks: saveLinks);
  }
}

extension RideSelfDriveRentalQueryWhereSort
    on QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QWhere> {
  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideSelfDriveRentalQueryWhere
    on QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QWhereClause> {
  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
      rentalIdEqualTo(String rentalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rentalId',
        value: [rentalId],
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterWhereClause>
      rentalIdNotEqualTo(String rentalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [],
              upper: [rentalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [rentalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [rentalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [],
              upper: [rentalId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideSelfDriveRentalQueryFilter on QueryBuilder<RideSelfDriveRental,
    RideSelfDriveRental, QFilterCondition> {
  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      actualReturnTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualReturnTime',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      actualReturnTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualReturnTime',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      actualReturnTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualReturnTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      actualReturnTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualReturnTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      actualReturnTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualReturnTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      actualReturnTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualReturnTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerCccd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerCccd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCccd',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerCccdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerCccd',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      dailyPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      dailyPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      dailyPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      dailyPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      depositEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deposit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      depositGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deposit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      depositLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deposit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      depositBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deposit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rentalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentalId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      rentalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rentalId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusEqualTo(
    String value, {
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusLessThan(
    String value, {
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehiclePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehiclePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehiclePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehiclePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehiclePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehiclePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehicleTypeEqualTo(VehicleType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehicleTypeGreaterThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehicleTypeLessThan(
    VehicleType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleType',
        value: value,
      ));
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterFilterCondition>
      vehicleTypeBetween(
    VehicleType lower,
    VehicleType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RideSelfDriveRentalQueryObject on QueryBuilder<RideSelfDriveRental,
    RideSelfDriveRental, QFilterCondition> {}

extension RideSelfDriveRentalQueryLinks on QueryBuilder<RideSelfDriveRental,
    RideSelfDriveRental, QFilterCondition> {}

extension RideSelfDriveRentalQuerySortBy
    on QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QSortBy> {
  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByActualReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByActualReturnTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCustomerCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCustomerCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByDailyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyPrice', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByDailyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyPrice', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deposit', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByDepositDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deposit', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByRentalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByRentalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByVehiclePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByVehiclePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      sortByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension RideSelfDriveRentalQuerySortThenBy
    on QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QSortThenBy> {
  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByActualReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByActualReturnTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCustomerCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCustomerCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByDailyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyPrice', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByDailyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyPrice', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deposit', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByDepositDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deposit', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByRentalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByRentalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByVehiclePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByVehiclePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehiclePlate', Sort.desc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.asc);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QAfterSortBy>
      thenByVehicleTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleType', Sort.desc);
    });
  }
}

extension RideSelfDriveRentalQueryWhereDistinct
    on QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct> {
  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByActualReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualReturnTime');
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByCustomerCccd({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerCccd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByCustomerPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByDailyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyPrice');
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByDeposit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deposit');
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByRentalId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByVehiclePlate({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehiclePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QDistinct>
      distinctByVehicleType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleType');
    });
  }
}

extension RideSelfDriveRentalQueryProperty
    on QueryBuilder<RideSelfDriveRental, RideSelfDriveRental, QQueryProperty> {
  QueryBuilder<RideSelfDriveRental, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideSelfDriveRental, DateTime?, QQueryOperations>
      actualReturnTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualReturnTime');
    });
  }

  QueryBuilder<RideSelfDriveRental, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideSelfDriveRental, String, QQueryOperations>
      customerCccdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerCccd');
    });
  }

  QueryBuilder<RideSelfDriveRental, String, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<RideSelfDriveRental, String, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<RideSelfDriveRental, double, QQueryOperations>
      dailyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyPrice');
    });
  }

  QueryBuilder<RideSelfDriveRental, double, QQueryOperations>
      depositProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deposit');
    });
  }

  QueryBuilder<RideSelfDriveRental, DateTime, QQueryOperations>
      endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<RideSelfDriveRental, String, QQueryOperations>
      rentalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentalId');
    });
  }

  QueryBuilder<RideSelfDriveRental, DateTime, QQueryOperations>
      startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<RideSelfDriveRental, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RideSelfDriveRental, String, QQueryOperations>
      vehiclePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehiclePlate');
    });
  }

  QueryBuilder<RideSelfDriveRental, VehicleType, QQueryOperations>
      vehicleTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleType');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideDeliveryOrderCollection on Isar {
  IsarCollection<RideDeliveryOrder> get rideDeliveryOrders => this.collection();
}

const RideDeliveryOrderSchema = CollectionSchema(
  name: r'RideDeliveryOrder',
  id: -3333586433621845833,
  properties: {
    r'completedAt': PropertySchema(
      id: 0,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerName': PropertySchema(
      id: 2,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 3,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'driverUuid': PropertySchema(
      id: 4,
      name: r'driverUuid',
      type: IsarType.string,
    ),
    r'dropoffAddress': PropertySchema(
      id: 5,
      name: r'dropoffAddress',
      type: IsarType.string,
    ),
    r'fee': PropertySchema(
      id: 6,
      name: r'fee',
      type: IsarType.double,
    ),
    r'itemNote': PropertySchema(
      id: 7,
      name: r'itemNote',
      type: IsarType.string,
    ),
    r'orderId': PropertySchema(
      id: 8,
      name: r'orderId',
      type: IsarType.string,
    ),
    r'pickupAddress': PropertySchema(
      id: 9,
      name: r'pickupAddress',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
    ),
    r'weightKg': PropertySchema(
      id: 11,
      name: r'weightKg',
      type: IsarType.double,
    )
  },
  estimateSize: _rideDeliveryOrderEstimateSize,
  serialize: _rideDeliveryOrderSerialize,
  deserialize: _rideDeliveryOrderDeserialize,
  deserializeProp: _rideDeliveryOrderDeserializeProp,
  idName: r'id',
  indexes: {
    r'orderId': IndexSchema(
      id: -6176610178429382285,
      name: r'orderId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'orderId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideDeliveryOrderGetId,
  getLinks: _rideDeliveryOrderGetLinks,
  attach: _rideDeliveryOrderAttach,
  version: '3.1.0+1',
);

int _rideDeliveryOrderEstimateSize(
  RideDeliveryOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.driverUuid.length * 3;
  bytesCount += 3 + object.dropoffAddress.length * 3;
  bytesCount += 3 + object.itemNote.length * 3;
  bytesCount += 3 + object.orderId.length * 3;
  bytesCount += 3 + object.pickupAddress.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _rideDeliveryOrderSerialize(
  RideDeliveryOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.completedAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.customerName);
  writer.writeString(offsets[3], object.customerPhone);
  writer.writeString(offsets[4], object.driverUuid);
  writer.writeString(offsets[5], object.dropoffAddress);
  writer.writeDouble(offsets[6], object.fee);
  writer.writeString(offsets[7], object.itemNote);
  writer.writeString(offsets[8], object.orderId);
  writer.writeString(offsets[9], object.pickupAddress);
  writer.writeString(offsets[10], object.status);
  writer.writeDouble(offsets[11], object.weightKg);
}

RideDeliveryOrder _rideDeliveryOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideDeliveryOrder();
  object.completedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.customerName = reader.readString(offsets[2]);
  object.customerPhone = reader.readString(offsets[3]);
  object.driverUuid = reader.readString(offsets[4]);
  object.dropoffAddress = reader.readString(offsets[5]);
  object.fee = reader.readDouble(offsets[6]);
  object.id = id;
  object.itemNote = reader.readString(offsets[7]);
  object.orderId = reader.readString(offsets[8]);
  object.pickupAddress = reader.readString(offsets[9]);
  object.status = reader.readString(offsets[10]);
  object.weightKg = reader.readDouble(offsets[11]);
  return object;
}

P _rideDeliveryOrderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideDeliveryOrderGetId(RideDeliveryOrder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideDeliveryOrderGetLinks(
    RideDeliveryOrder object) {
  return [];
}

void _rideDeliveryOrderAttach(
    IsarCollection<dynamic> col, Id id, RideDeliveryOrder object) {
  object.id = id;
}

extension RideDeliveryOrderByIndex on IsarCollection<RideDeliveryOrder> {
  Future<RideDeliveryOrder?> getByOrderId(String orderId) {
    return getByIndex(r'orderId', [orderId]);
  }

  RideDeliveryOrder? getByOrderIdSync(String orderId) {
    return getByIndexSync(r'orderId', [orderId]);
  }

  Future<bool> deleteByOrderId(String orderId) {
    return deleteByIndex(r'orderId', [orderId]);
  }

  bool deleteByOrderIdSync(String orderId) {
    return deleteByIndexSync(r'orderId', [orderId]);
  }

  Future<List<RideDeliveryOrder?>> getAllByOrderId(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'orderId', values);
  }

  List<RideDeliveryOrder?> getAllByOrderIdSync(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'orderId', values);
  }

  Future<int> deleteAllByOrderId(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'orderId', values);
  }

  int deleteAllByOrderIdSync(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'orderId', values);
  }

  Future<Id> putByOrderId(RideDeliveryOrder object) {
    return putByIndex(r'orderId', object);
  }

  Id putByOrderIdSync(RideDeliveryOrder object, {bool saveLinks = true}) {
    return putByIndexSync(r'orderId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderId(List<RideDeliveryOrder> objects) {
    return putAllByIndex(r'orderId', objects);
  }

  List<Id> putAllByOrderIdSync(List<RideDeliveryOrder> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'orderId', objects, saveLinks: saveLinks);
  }
}

extension RideDeliveryOrderQueryWhereSort
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QWhere> {
  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideDeliveryOrderQueryWhere
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QWhereClause> {
  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
      orderIdEqualTo(String orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterWhereClause>
      orderIdNotEqualTo(String orderId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [],
              upper: [orderId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [orderId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [orderId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderId',
              lower: [],
              upper: [orderId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideDeliveryOrderQueryFilter
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QFilterCondition> {
  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      driverUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dropoffAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dropoffAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dropoffAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      dropoffAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dropoffAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      feeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      feeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      feeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      feeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemNote',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemNote',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemNote',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemNote',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      itemNoteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemNote',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      orderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickupAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pickupAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pickupAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      pickupAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pickupAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusEqualTo(
    String value, {
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusLessThan(
    String value, {
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusStartsWith(
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      weightKgEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weightKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      weightKgGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weightKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      weightKgLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weightKg',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterFilterCondition>
      weightKgBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weightKg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RideDeliveryOrderQueryObject
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QFilterCondition> {}

extension RideDeliveryOrderQueryLinks
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QFilterCondition> {}

extension RideDeliveryOrderQuerySortBy
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QSortBy> {
  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy> sortByFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fee', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fee', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByItemNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNote', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByItemNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNote', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      sortByWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.desc);
    });
  }
}

extension RideDeliveryOrderQuerySortThenBy
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QSortThenBy> {
  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByDriverUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByDriverUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverUuid', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByDropoffAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByDropoffAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dropoffAddress', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy> thenByFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fee', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fee', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByItemNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNote', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByItemNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemNote', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByPickupAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByPickupAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickupAddress', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.asc);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QAfterSortBy>
      thenByWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.desc);
    });
  }
}

extension RideDeliveryOrderQueryWhereDistinct
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct> {
  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByCustomerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByCustomerPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByDriverUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByDropoffAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dropoffAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fee');
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByItemNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemNote', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByOrderId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByPickupAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickupAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QDistinct>
      distinctByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightKg');
    });
  }
}

extension RideDeliveryOrderQueryProperty
    on QueryBuilder<RideDeliveryOrder, RideDeliveryOrder, QQueryProperty> {
  QueryBuilder<RideDeliveryOrder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideDeliveryOrder, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<RideDeliveryOrder, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations>
      customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations>
      driverUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverUuid');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations>
      dropoffAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dropoffAddress');
    });
  }

  QueryBuilder<RideDeliveryOrder, double, QQueryOperations> feeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fee');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations> itemNoteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemNote');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations>
      pickupAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickupAddress');
    });
  }

  QueryBuilder<RideDeliveryOrder, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RideDeliveryOrder, double, QQueryOperations> weightKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightKg');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRideCorporateAccountCollection on Isar {
  IsarCollection<RideCorporateAccount> get rideCorporateAccounts =>
      this.collection();
}

const RideCorporateAccountSchema = CollectionSchema(
  name: r'RideCorporateAccount',
  id: -2370887925781929042,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'companyName': PropertySchema(
      id: 1,
      name: r'companyName',
      type: IsarType.string,
    ),
    r'contactPhone': PropertySchema(
      id: 2,
      name: r'contactPhone',
      type: IsarType.string,
    ),
    r'corpId': PropertySchema(
      id: 3,
      name: r'corpId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'creditLimitVnd': PropertySchema(
      id: 5,
      name: r'creditLimitVnd',
      type: IsarType.double,
    ),
    r'currentDebt': PropertySchema(
      id: 6,
      name: r'currentDebt',
      type: IsarType.double,
    ),
    r'invoiceDayOfMonth': PropertySchema(
      id: 7,
      name: r'invoiceDayOfMonth',
      type: IsarType.long,
    ),
    r'taxCode': PropertySchema(
      id: 8,
      name: r'taxCode',
      type: IsarType.string,
    )
  },
  estimateSize: _rideCorporateAccountEstimateSize,
  serialize: _rideCorporateAccountSerialize,
  deserialize: _rideCorporateAccountDeserialize,
  deserializeProp: _rideCorporateAccountDeserializeProp,
  idName: r'id',
  indexes: {
    r'corpId': IndexSchema(
      id: 8333521246898490058,
      name: r'corpId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'corpId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _rideCorporateAccountGetId,
  getLinks: _rideCorporateAccountGetLinks,
  attach: _rideCorporateAccountAttach,
  version: '3.1.0+1',
);

int _rideCorporateAccountEstimateSize(
  RideCorporateAccount object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.companyName.length * 3;
  bytesCount += 3 + object.contactPhone.length * 3;
  bytesCount += 3 + object.corpId.length * 3;
  bytesCount += 3 + object.taxCode.length * 3;
  return bytesCount;
}

void _rideCorporateAccountSerialize(
  RideCorporateAccount object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.companyName);
  writer.writeString(offsets[2], object.contactPhone);
  writer.writeString(offsets[3], object.corpId);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDouble(offsets[5], object.creditLimitVnd);
  writer.writeDouble(offsets[6], object.currentDebt);
  writer.writeLong(offsets[7], object.invoiceDayOfMonth);
  writer.writeString(offsets[8], object.taxCode);
}

RideCorporateAccount _rideCorporateAccountDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RideCorporateAccount();
  object.active = reader.readBool(offsets[0]);
  object.companyName = reader.readString(offsets[1]);
  object.contactPhone = reader.readString(offsets[2]);
  object.corpId = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.creditLimitVnd = reader.readDouble(offsets[5]);
  object.currentDebt = reader.readDouble(offsets[6]);
  object.id = id;
  object.invoiceDayOfMonth = reader.readLong(offsets[7]);
  object.taxCode = reader.readString(offsets[8]);
  return object;
}

P _rideCorporateAccountDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rideCorporateAccountGetId(RideCorporateAccount object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rideCorporateAccountGetLinks(
    RideCorporateAccount object) {
  return [];
}

void _rideCorporateAccountAttach(
    IsarCollection<dynamic> col, Id id, RideCorporateAccount object) {
  object.id = id;
}

extension RideCorporateAccountByIndex on IsarCollection<RideCorporateAccount> {
  Future<RideCorporateAccount?> getByCorpId(String corpId) {
    return getByIndex(r'corpId', [corpId]);
  }

  RideCorporateAccount? getByCorpIdSync(String corpId) {
    return getByIndexSync(r'corpId', [corpId]);
  }

  Future<bool> deleteByCorpId(String corpId) {
    return deleteByIndex(r'corpId', [corpId]);
  }

  bool deleteByCorpIdSync(String corpId) {
    return deleteByIndexSync(r'corpId', [corpId]);
  }

  Future<List<RideCorporateAccount?>> getAllByCorpId(
      List<String> corpIdValues) {
    final values = corpIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'corpId', values);
  }

  List<RideCorporateAccount?> getAllByCorpIdSync(List<String> corpIdValues) {
    final values = corpIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'corpId', values);
  }

  Future<int> deleteAllByCorpId(List<String> corpIdValues) {
    final values = corpIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'corpId', values);
  }

  int deleteAllByCorpIdSync(List<String> corpIdValues) {
    final values = corpIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'corpId', values);
  }

  Future<Id> putByCorpId(RideCorporateAccount object) {
    return putByIndex(r'corpId', object);
  }

  Id putByCorpIdSync(RideCorporateAccount object, {bool saveLinks = true}) {
    return putByIndexSync(r'corpId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCorpId(List<RideCorporateAccount> objects) {
    return putAllByIndex(r'corpId', objects);
  }

  List<Id> putAllByCorpIdSync(List<RideCorporateAccount> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'corpId', objects, saveLinks: saveLinks);
  }
}

extension RideCorporateAccountQueryWhereSort
    on QueryBuilder<RideCorporateAccount, RideCorporateAccount, QWhere> {
  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RideCorporateAccountQueryWhere
    on QueryBuilder<RideCorporateAccount, RideCorporateAccount, QWhereClause> {
  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
      corpIdEqualTo(String corpId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'corpId',
        value: [corpId],
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterWhereClause>
      corpIdNotEqualTo(String corpId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'corpId',
              lower: [],
              upper: [corpId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'corpId',
              lower: [corpId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'corpId',
              lower: [corpId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'corpId',
              lower: [],
              upper: [corpId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RideCorporateAccountQueryFilter on QueryBuilder<RideCorporateAccount,
    RideCorporateAccount, QFilterCondition> {
  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'companyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      companyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'companyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      companyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'companyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> companyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'companyName',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contactPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      contactPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contactPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      contactPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contactPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> contactPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contactPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'corpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'corpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'corpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'corpId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'corpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'corpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      corpIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'corpId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      corpIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'corpId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'corpId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> corpIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'corpId',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> creditLimitVndEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creditLimitVnd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> creditLimitVndGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creditLimitVnd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> creditLimitVndLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creditLimitVnd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> creditLimitVndBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creditLimitVnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> currentDebtEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> currentDebtGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> currentDebtLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> currentDebtBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentDebt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> invoiceDayOfMonthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceDayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> invoiceDayOfMonthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceDayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> invoiceDayOfMonthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceDayOfMonth',
        value: value,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> invoiceDayOfMonthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceDayOfMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeEqualTo(
    String value, {
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeGreaterThan(
    String value, {
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeLessThan(
    String value, {
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeStartsWith(
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeEndsWith(
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

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      taxCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
          QAfterFilterCondition>
      taxCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount,
      QAfterFilterCondition> taxCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxCode',
        value: '',
      ));
    });
  }
}

extension RideCorporateAccountQueryObject on QueryBuilder<RideCorporateAccount,
    RideCorporateAccount, QFilterCondition> {}

extension RideCorporateAccountQueryLinks on QueryBuilder<RideCorporateAccount,
    RideCorporateAccount, QFilterCondition> {}

extension RideCorporateAccountQuerySortBy
    on QueryBuilder<RideCorporateAccount, RideCorporateAccount, QSortBy> {
  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCorpId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corpId', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCorpIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corpId', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCreditLimitVnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditLimitVnd', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCreditLimitVndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditLimitVnd', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByCurrentDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByInvoiceDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByInvoiceDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      sortByTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.desc);
    });
  }
}

extension RideCorporateAccountQuerySortThenBy
    on QueryBuilder<RideCorporateAccount, RideCorporateAccount, QSortThenBy> {
  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCompanyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCompanyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'companyName', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByContactPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByContactPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contactPhone', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCorpId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corpId', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCorpIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'corpId', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCreditLimitVnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditLimitVnd', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCreditLimitVndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditLimitVnd', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByCurrentDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByInvoiceDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDayOfMonth', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByInvoiceDayOfMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDayOfMonth', Sort.desc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.asc);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QAfterSortBy>
      thenByTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.desc);
    });
  }
}

extension RideCorporateAccountQueryWhereDistinct
    on QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct> {
  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByCompanyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'companyName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByContactPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contactPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByCorpId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'corpId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByCreditLimitVnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creditLimitVnd');
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentDebt');
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByInvoiceDayOfMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceDayOfMonth');
    });
  }

  QueryBuilder<RideCorporateAccount, RideCorporateAccount, QDistinct>
      distinctByTaxCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxCode', caseSensitive: caseSensitive);
    });
  }
}

extension RideCorporateAccountQueryProperty on QueryBuilder<
    RideCorporateAccount, RideCorporateAccount, QQueryProperty> {
  QueryBuilder<RideCorporateAccount, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RideCorporateAccount, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<RideCorporateAccount, String, QQueryOperations>
      companyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'companyName');
    });
  }

  QueryBuilder<RideCorporateAccount, String, QQueryOperations>
      contactPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contactPhone');
    });
  }

  QueryBuilder<RideCorporateAccount, String, QQueryOperations>
      corpIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'corpId');
    });
  }

  QueryBuilder<RideCorporateAccount, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RideCorporateAccount, double, QQueryOperations>
      creditLimitVndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creditLimitVnd');
    });
  }

  QueryBuilder<RideCorporateAccount, double, QQueryOperations>
      currentDebtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentDebt');
    });
  }

  QueryBuilder<RideCorporateAccount, int, QQueryOperations>
      invoiceDayOfMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceDayOfMonth');
    });
  }

  QueryBuilder<RideCorporateAccount, String, QQueryOperations>
      taxCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxCode');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRidePartnerApiKeyCollection on Isar {
  IsarCollection<RidePartnerApiKey> get ridePartnerApiKeys => this.collection();
}

const RidePartnerApiKeySchema = CollectionSchema(
  name: r'RidePartnerApiKey',
  id: 3824470292717480864,
  properties: {
    r'active': PropertySchema(
      id: 0,
      name: r'active',
      type: IsarType.bool,
    ),
    r'apiKeyHash': PropertySchema(
      id: 1,
      name: r'apiKeyHash',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'keyId': PropertySchema(
      id: 3,
      name: r'keyId',
      type: IsarType.string,
    ),
    r'partnerName': PropertySchema(
      id: 4,
      name: r'partnerName',
      type: IsarType.string,
    ),
    r'quotaPerDay': PropertySchema(
      id: 5,
      name: r'quotaPerDay',
      type: IsarType.long,
    ),
    r'usedToday': PropertySchema(
      id: 6,
      name: r'usedToday',
      type: IsarType.long,
    )
  },
  estimateSize: _ridePartnerApiKeyEstimateSize,
  serialize: _ridePartnerApiKeySerialize,
  deserialize: _ridePartnerApiKeyDeserialize,
  deserializeProp: _ridePartnerApiKeyDeserializeProp,
  idName: r'id',
  indexes: {
    r'keyId': IndexSchema(
      id: 2852921932302977192,
      name: r'keyId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'keyId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ridePartnerApiKeyGetId,
  getLinks: _ridePartnerApiKeyGetLinks,
  attach: _ridePartnerApiKeyAttach,
  version: '3.1.0+1',
);

int _ridePartnerApiKeyEstimateSize(
  RidePartnerApiKey object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apiKeyHash.length * 3;
  bytesCount += 3 + object.keyId.length * 3;
  bytesCount += 3 + object.partnerName.length * 3;
  return bytesCount;
}

void _ridePartnerApiKeySerialize(
  RidePartnerApiKey object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.active);
  writer.writeString(offsets[1], object.apiKeyHash);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.keyId);
  writer.writeString(offsets[4], object.partnerName);
  writer.writeLong(offsets[5], object.quotaPerDay);
  writer.writeLong(offsets[6], object.usedToday);
}

RidePartnerApiKey _ridePartnerApiKeyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RidePartnerApiKey();
  object.active = reader.readBool(offsets[0]);
  object.apiKeyHash = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.keyId = reader.readString(offsets[3]);
  object.partnerName = reader.readString(offsets[4]);
  object.quotaPerDay = reader.readLong(offsets[5]);
  object.usedToday = reader.readLong(offsets[6]);
  return object;
}

P _ridePartnerApiKeyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ridePartnerApiKeyGetId(RidePartnerApiKey object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ridePartnerApiKeyGetLinks(
    RidePartnerApiKey object) {
  return [];
}

void _ridePartnerApiKeyAttach(
    IsarCollection<dynamic> col, Id id, RidePartnerApiKey object) {
  object.id = id;
}

extension RidePartnerApiKeyByIndex on IsarCollection<RidePartnerApiKey> {
  Future<RidePartnerApiKey?> getByKeyId(String keyId) {
    return getByIndex(r'keyId', [keyId]);
  }

  RidePartnerApiKey? getByKeyIdSync(String keyId) {
    return getByIndexSync(r'keyId', [keyId]);
  }

  Future<bool> deleteByKeyId(String keyId) {
    return deleteByIndex(r'keyId', [keyId]);
  }

  bool deleteByKeyIdSync(String keyId) {
    return deleteByIndexSync(r'keyId', [keyId]);
  }

  Future<List<RidePartnerApiKey?>> getAllByKeyId(List<String> keyIdValues) {
    final values = keyIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'keyId', values);
  }

  List<RidePartnerApiKey?> getAllByKeyIdSync(List<String> keyIdValues) {
    final values = keyIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'keyId', values);
  }

  Future<int> deleteAllByKeyId(List<String> keyIdValues) {
    final values = keyIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'keyId', values);
  }

  int deleteAllByKeyIdSync(List<String> keyIdValues) {
    final values = keyIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'keyId', values);
  }

  Future<Id> putByKeyId(RidePartnerApiKey object) {
    return putByIndex(r'keyId', object);
  }

  Id putByKeyIdSync(RidePartnerApiKey object, {bool saveLinks = true}) {
    return putByIndexSync(r'keyId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKeyId(List<RidePartnerApiKey> objects) {
    return putAllByIndex(r'keyId', objects);
  }

  List<Id> putAllByKeyIdSync(List<RidePartnerApiKey> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'keyId', objects, saveLinks: saveLinks);
  }
}

extension RidePartnerApiKeyQueryWhereSort
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QWhere> {
  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RidePartnerApiKeyQueryWhere
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QWhereClause> {
  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
      keyIdEqualTo(String keyId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'keyId',
        value: [keyId],
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterWhereClause>
      keyIdNotEqualTo(String keyId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyId',
              lower: [],
              upper: [keyId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyId',
              lower: [keyId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyId',
              lower: [keyId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyId',
              lower: [],
              upper: [keyId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RidePartnerApiKeyQueryFilter
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QFilterCondition> {
  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      activeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'active',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKeyHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiKeyHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiKeyHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiKeyHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiKeyHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiKeyHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiKeyHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiKeyHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKeyHash',
        value: '',
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      apiKeyHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiKeyHash',
        value: '',
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
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

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyId',
        value: '',
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      keyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keyId',
        value: '',
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partnerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partnerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partnerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partnerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'partnerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'partnerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'partnerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'partnerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partnerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      partnerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'partnerName',
        value: '',
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      quotaPerDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quotaPerDay',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      quotaPerDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quotaPerDay',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      quotaPerDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quotaPerDay',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      quotaPerDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quotaPerDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      usedTodayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedToday',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      usedTodayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedToday',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      usedTodayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedToday',
        value: value,
      ));
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterFilterCondition>
      usedTodayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedToday',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RidePartnerApiKeyQueryObject
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QFilterCondition> {}

extension RidePartnerApiKeyQueryLinks
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QFilterCondition> {}

extension RidePartnerApiKeyQuerySortBy
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QSortBy> {
  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByApiKeyHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKeyHash', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByApiKeyHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKeyHash', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByKeyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyId', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByKeyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyId', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByPartnerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnerName', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByPartnerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnerName', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByQuotaPerDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaPerDay', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByQuotaPerDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaPerDay', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByUsedToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedToday', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      sortByUsedTodayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedToday', Sort.desc);
    });
  }
}

extension RidePartnerApiKeyQuerySortThenBy
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QSortThenBy> {
  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'active', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByApiKeyHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKeyHash', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByApiKeyHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKeyHash', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByKeyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyId', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByKeyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyId', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByPartnerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnerName', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByPartnerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnerName', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByQuotaPerDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaPerDay', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByQuotaPerDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quotaPerDay', Sort.desc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByUsedToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedToday', Sort.asc);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QAfterSortBy>
      thenByUsedTodayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usedToday', Sort.desc);
    });
  }
}

extension RidePartnerApiKeyQueryWhereDistinct
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct> {
  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct>
      distinctByActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'active');
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct>
      distinctByApiKeyHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiKeyHash', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct> distinctByKeyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keyId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct>
      distinctByPartnerName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partnerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct>
      distinctByQuotaPerDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quotaPerDay');
    });
  }

  QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QDistinct>
      distinctByUsedToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedToday');
    });
  }
}

extension RidePartnerApiKeyQueryProperty
    on QueryBuilder<RidePartnerApiKey, RidePartnerApiKey, QQueryProperty> {
  QueryBuilder<RidePartnerApiKey, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RidePartnerApiKey, bool, QQueryOperations> activeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'active');
    });
  }

  QueryBuilder<RidePartnerApiKey, String, QQueryOperations>
      apiKeyHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiKeyHash');
    });
  }

  QueryBuilder<RidePartnerApiKey, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RidePartnerApiKey, String, QQueryOperations> keyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keyId');
    });
  }

  QueryBuilder<RidePartnerApiKey, String, QQueryOperations>
      partnerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partnerName');
    });
  }

  QueryBuilder<RidePartnerApiKey, int, QQueryOperations> quotaPerDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quotaPerDay');
    });
  }

  QueryBuilder<RidePartnerApiKey, int, QQueryOperations> usedTodayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedToday');
    });
  }
}
