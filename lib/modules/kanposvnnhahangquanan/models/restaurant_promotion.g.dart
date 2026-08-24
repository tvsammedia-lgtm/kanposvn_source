// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_promotion.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantPromotionCollection on Isar {
  IsarCollection<RestaurantPromotion> get restaurantPromotions =>
      this.collection();
}

const RestaurantPromotionSchema = CollectionSchema(
  name: r'RestaurantPromotion',
  id: -7292158850251950140,
  properties: {
    r'buyQty': PropertySchema(
      id: 0,
      name: r'buyQty',
      type: IsarType.long,
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
    r'getQty': PropertySchema(
      id: 3,
      name: r'getQty',
      type: IsarType.long,
    ),
    r'happyHourEndMinute': PropertySchema(
      id: 4,
      name: r'happyHourEndMinute',
      type: IsarType.long,
    ),
    r'happyHourStartMinute': PropertySchema(
      id: 5,
      name: r'happyHourStartMinute',
      type: IsarType.long,
    ),
    r'isActive': PropertySchema(
      id: 6,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'itemId': PropertySchema(
      id: 8,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 9,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'promoId': PropertySchema(
      id: 11,
      name: r'promoId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.byte,
      enumMap: _RestaurantPromotiontypeEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'value': PropertySchema(
      id: 14,
      name: r'value',
      type: IsarType.double,
    ),
    r'version': PropertySchema(
      id: 15,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _restaurantPromotionEstimateSize,
  serialize: _restaurantPromotionSerialize,
  deserialize: _restaurantPromotionDeserialize,
  deserializeProp: _restaurantPromotionDeserializeProp,
  idName: r'id',
  indexes: {
    r'promoId': IndexSchema(
      id: 5518163522698292910,
      name: r'promoId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'promoId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _restaurantPromotionGetId,
  getLinks: _restaurantPromotionGetLinks,
  attach: _restaurantPromotionAttach,
  version: '3.1.0+1',
);

int _restaurantPromotionEstimateSize(
  RestaurantPromotion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.promoId.length * 3;
  return bytesCount;
}

void _restaurantPromotionSerialize(
  RestaurantPromotion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.buyQty);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeLong(offsets[3], object.getQty);
  writer.writeLong(offsets[4], object.happyHourEndMinute);
  writer.writeLong(offsets[5], object.happyHourStartMinute);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeString(offsets[8], object.itemId);
  writer.writeString(offsets[9], object.itemName);
  writer.writeString(offsets[10], object.name);
  writer.writeString(offsets[11], object.promoId);
  writer.writeByte(offsets[12], object.type.index);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeDouble(offsets[14], object.value);
  writer.writeLong(offsets[15], object.version);
}

RestaurantPromotion _restaurantPromotionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantPromotion();
  object.buyQty = reader.readLong(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.getQty = reader.readLong(offsets[3]);
  object.happyHourEndMinute = reader.readLong(offsets[4]);
  object.happyHourStartMinute = reader.readLong(offsets[5]);
  object.id = id;
  object.isActive = reader.readBool(offsets[6]);
  object.isSynced = reader.readBool(offsets[7]);
  object.itemId = reader.readString(offsets[8]);
  object.itemName = reader.readString(offsets[9]);
  object.name = reader.readString(offsets[10]);
  object.promoId = reader.readString(offsets[11]);
  object.type = _RestaurantPromotiontypeValueEnumMap[
          reader.readByteOrNull(offsets[12])] ??
      RestaurantPromotionType.PERCENT;
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.value = reader.readDouble(offsets[14]);
  object.version = reader.readLong(offsets[15]);
  return object;
}

P _restaurantPromotionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (_RestaurantPromotiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RestaurantPromotionType.PERCENT) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RestaurantPromotiontypeEnumValueMap = {
  'PERCENT': 0,
  'FIXED_AMOUNT': 1,
  'BUY_X_GET_Y': 2,
};
const _RestaurantPromotiontypeValueEnumMap = {
  0: RestaurantPromotionType.PERCENT,
  1: RestaurantPromotionType.FIXED_AMOUNT,
  2: RestaurantPromotionType.BUY_X_GET_Y,
};

Id _restaurantPromotionGetId(RestaurantPromotion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _restaurantPromotionGetLinks(
    RestaurantPromotion object) {
  return [];
}

void _restaurantPromotionAttach(
    IsarCollection<dynamic> col, Id id, RestaurantPromotion object) {
  object.id = id;
}

extension RestaurantPromotionByIndex on IsarCollection<RestaurantPromotion> {
  Future<RestaurantPromotion?> getByPromoId(String promoId) {
    return getByIndex(r'promoId', [promoId]);
  }

  RestaurantPromotion? getByPromoIdSync(String promoId) {
    return getByIndexSync(r'promoId', [promoId]);
  }

  Future<bool> deleteByPromoId(String promoId) {
    return deleteByIndex(r'promoId', [promoId]);
  }

  bool deleteByPromoIdSync(String promoId) {
    return deleteByIndexSync(r'promoId', [promoId]);
  }

  Future<List<RestaurantPromotion?>> getAllByPromoId(
      List<String> promoIdValues) {
    final values = promoIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'promoId', values);
  }

  List<RestaurantPromotion?> getAllByPromoIdSync(List<String> promoIdValues) {
    final values = promoIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'promoId', values);
  }

  Future<int> deleteAllByPromoId(List<String> promoIdValues) {
    final values = promoIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'promoId', values);
  }

  int deleteAllByPromoIdSync(List<String> promoIdValues) {
    final values = promoIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'promoId', values);
  }

  Future<Id> putByPromoId(RestaurantPromotion object) {
    return putByIndex(r'promoId', object);
  }

  Id putByPromoIdSync(RestaurantPromotion object, {bool saveLinks = true}) {
    return putByIndexSync(r'promoId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPromoId(List<RestaurantPromotion> objects) {
    return putAllByIndex(r'promoId', objects);
  }

  List<Id> putAllByPromoIdSync(List<RestaurantPromotion> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'promoId', objects, saveLinks: saveLinks);
  }
}

extension RestaurantPromotionQueryWhereSort
    on QueryBuilder<RestaurantPromotion, RestaurantPromotion, QWhere> {
  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RestaurantPromotionQueryWhere
    on QueryBuilder<RestaurantPromotion, RestaurantPromotion, QWhereClause> {
  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
      promoIdEqualTo(String promoId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'promoId',
        value: [promoId],
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterWhereClause>
      promoIdNotEqualTo(String promoId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'promoId',
              lower: [],
              upper: [promoId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'promoId',
              lower: [promoId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'promoId',
              lower: [promoId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'promoId',
              lower: [],
              upper: [promoId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RestaurantPromotionQueryFilter on QueryBuilder<RestaurantPromotion,
    RestaurantPromotion, QFilterCondition> {
  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      buyQtyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buyQty',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      buyQtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buyQty',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      buyQtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buyQty',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      buyQtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buyQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      getQtyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getQty',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      getQtyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'getQty',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      getQtyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'getQty',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      getQtyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'getQty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourEndMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'happyHourEndMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourEndMinuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'happyHourEndMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourEndMinuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'happyHourEndMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourEndMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'happyHourEndMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourStartMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'happyHourStartMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourStartMinuteGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'happyHourStartMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourStartMinuteLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'happyHourStartMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      happyHourStartMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'happyHourStartMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'promoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'promoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'promoId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'promoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'promoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'promoId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'promoId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'promoId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      promoIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'promoId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      typeEqualTo(RestaurantPromotionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      typeGreaterThan(
    RestaurantPromotionType value, {
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      typeLessThan(
    RestaurantPromotionType value, {
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      typeBetween(
    RestaurantPromotionType lower,
    RestaurantPromotionType upper, {
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterFilterCondition>
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

extension RestaurantPromotionQueryObject on QueryBuilder<RestaurantPromotion,
    RestaurantPromotion, QFilterCondition> {}

extension RestaurantPromotionQueryLinks on QueryBuilder<RestaurantPromotion,
    RestaurantPromotion, QFilterCondition> {}

extension RestaurantPromotionQuerySortBy
    on QueryBuilder<RestaurantPromotion, RestaurantPromotion, QSortBy> {
  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByBuyQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyQty', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByBuyQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyQty', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByGetQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getQty', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByGetQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getQty', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByHappyHourEndMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourEndMinute', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByHappyHourEndMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourEndMinute', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByHappyHourStartMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourStartMinute', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByHappyHourStartMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourStartMinute', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByPromoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByPromoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension RestaurantPromotionQuerySortThenBy
    on QueryBuilder<RestaurantPromotion, RestaurantPromotion, QSortThenBy> {
  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByBuyQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyQty', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByBuyQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buyQty', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByGetQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getQty', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByGetQtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getQty', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByHappyHourEndMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourEndMinute', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByHappyHourEndMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourEndMinute', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByHappyHourStartMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourStartMinute', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByHappyHourStartMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'happyHourStartMinute', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByPromoId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByPromoIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'promoId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'value', Sort.desc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension RestaurantPromotionQueryWhereDistinct
    on QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct> {
  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByBuyQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buyQty');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByGetQty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'getQty');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByHappyHourEndMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'happyHourEndMinute');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByHappyHourStartMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'happyHourStartMinute');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByPromoId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'promoId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'value');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotion, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension RestaurantPromotionQueryProperty
    on QueryBuilder<RestaurantPromotion, RestaurantPromotion, QQueryProperty> {
  QueryBuilder<RestaurantPromotion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantPromotion, int, QQueryOperations> buyQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buyQty');
    });
  }

  QueryBuilder<RestaurantPromotion, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<RestaurantPromotion, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<RestaurantPromotion, int, QQueryOperations> getQtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'getQty');
    });
  }

  QueryBuilder<RestaurantPromotion, int, QQueryOperations>
      happyHourEndMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'happyHourEndMinute');
    });
  }

  QueryBuilder<RestaurantPromotion, int, QQueryOperations>
      happyHourStartMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'happyHourStartMinute');
    });
  }

  QueryBuilder<RestaurantPromotion, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<RestaurantPromotion, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<RestaurantPromotion, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<RestaurantPromotion, String, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<RestaurantPromotion, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RestaurantPromotion, String, QQueryOperations>
      promoIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'promoId');
    });
  }

  QueryBuilder<RestaurantPromotion, RestaurantPromotionType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<RestaurantPromotion, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<RestaurantPromotion, double, QQueryOperations> valueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'value');
    });
  }

  QueryBuilder<RestaurantPromotion, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
