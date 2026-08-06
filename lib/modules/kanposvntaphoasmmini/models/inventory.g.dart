// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTapHoaInventoryItemCollection on Isar {
  IsarCollection<TapHoaInventoryItem> get tapHoaInventoryItems =>
      this.collection();
}

const TapHoaInventoryItemSchema = CollectionSchema(
  name: r'TapHoaInventoryItem',
  id: -7074816555972049447,
  properties: {
    r'costPrice': PropertySchema(
      id: 0,
      name: r'costPrice',
      type: IsarType.double,
    ),
    r'currentStock': PropertySchema(
      id: 1,
      name: r'currentStock',
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
    r'inventoryItemId': PropertySchema(
      id: 4,
      name: r'inventoryItemId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'maxStock': PropertySchema(
      id: 6,
      name: r'maxStock',
      type: IsarType.double,
    ),
    r'minStock': PropertySchema(
      id: 7,
      name: r'minStock',
      type: IsarType.double,
    ),
    r'productId': PropertySchema(
      id: 8,
      name: r'productId',
      type: IsarType.string,
    ),
    r'productName': PropertySchema(
      id: 9,
      name: r'productName',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 10,
      name: r'unit',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 12,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _tapHoaInventoryItemEstimateSize,
  serialize: _tapHoaInventoryItemSerialize,
  deserialize: _tapHoaInventoryItemDeserialize,
  deserializeProp: _tapHoaInventoryItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'inventoryItemId': IndexSchema(
      id: -8922134744435378615,
      name: r'inventoryItemId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'inventoryItemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tapHoaInventoryItemGetId,
  getLinks: _tapHoaInventoryItemGetLinks,
  attach: _tapHoaInventoryItemAttach,
  version: '3.1.0+1',
);

int _tapHoaInventoryItemEstimateSize(
  TapHoaInventoryItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.inventoryItemId.length * 3;
  bytesCount += 3 + object.productId.length * 3;
  bytesCount += 3 + object.productName.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _tapHoaInventoryItemSerialize(
  TapHoaInventoryItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.costPrice);
  writer.writeDouble(offsets[1], object.currentStock);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeString(offsets[4], object.inventoryItemId);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeDouble(offsets[6], object.maxStock);
  writer.writeDouble(offsets[7], object.minStock);
  writer.writeString(offsets[8], object.productId);
  writer.writeString(offsets[9], object.productName);
  writer.writeString(offsets[10], object.unit);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeLong(offsets[12], object.version);
}

TapHoaInventoryItem _tapHoaInventoryItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TapHoaInventoryItem();
  object.costPrice = reader.readDouble(offsets[0]);
  object.currentStock = reader.readDouble(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.id = id;
  object.inventoryItemId = reader.readString(offsets[4]);
  object.isSynced = reader.readBool(offsets[5]);
  object.maxStock = reader.readDouble(offsets[6]);
  object.minStock = reader.readDouble(offsets[7]);
  object.productId = reader.readString(offsets[8]);
  object.productName = reader.readString(offsets[9]);
  object.unit = reader.readString(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.version = reader.readLong(offsets[12]);
  return object;
}

P _tapHoaInventoryItemDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tapHoaInventoryItemGetId(TapHoaInventoryItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tapHoaInventoryItemGetLinks(
    TapHoaInventoryItem object) {
  return [];
}

void _tapHoaInventoryItemAttach(
    IsarCollection<dynamic> col, Id id, TapHoaInventoryItem object) {
  object.id = id;
}

extension TapHoaInventoryItemByIndex on IsarCollection<TapHoaInventoryItem> {
  Future<TapHoaInventoryItem?> getByInventoryItemId(String inventoryItemId) {
    return getByIndex(r'inventoryItemId', [inventoryItemId]);
  }

  TapHoaInventoryItem? getByInventoryItemIdSync(String inventoryItemId) {
    return getByIndexSync(r'inventoryItemId', [inventoryItemId]);
  }

  Future<bool> deleteByInventoryItemId(String inventoryItemId) {
    return deleteByIndex(r'inventoryItemId', [inventoryItemId]);
  }

  bool deleteByInventoryItemIdSync(String inventoryItemId) {
    return deleteByIndexSync(r'inventoryItemId', [inventoryItemId]);
  }

  Future<List<TapHoaInventoryItem?>> getAllByInventoryItemId(
      List<String> inventoryItemIdValues) {
    final values = inventoryItemIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'inventoryItemId', values);
  }

  List<TapHoaInventoryItem?> getAllByInventoryItemIdSync(
      List<String> inventoryItemIdValues) {
    final values = inventoryItemIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'inventoryItemId', values);
  }

  Future<int> deleteAllByInventoryItemId(List<String> inventoryItemIdValues) {
    final values = inventoryItemIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'inventoryItemId', values);
  }

  int deleteAllByInventoryItemIdSync(List<String> inventoryItemIdValues) {
    final values = inventoryItemIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'inventoryItemId', values);
  }

  Future<Id> putByInventoryItemId(TapHoaInventoryItem object) {
    return putByIndex(r'inventoryItemId', object);
  }

  Id putByInventoryItemIdSync(TapHoaInventoryItem object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'inventoryItemId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByInventoryItemId(List<TapHoaInventoryItem> objects) {
    return putAllByIndex(r'inventoryItemId', objects);
  }

  List<Id> putAllByInventoryItemIdSync(List<TapHoaInventoryItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'inventoryItemId', objects, saveLinks: saveLinks);
  }
}

extension TapHoaInventoryItemQueryWhereSort
    on QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QWhere> {
  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TapHoaInventoryItemQueryWhere
    on QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QWhereClause> {
  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
      inventoryItemIdEqualTo(String inventoryItemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'inventoryItemId',
        value: [inventoryItemId],
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterWhereClause>
      inventoryItemIdNotEqualTo(String inventoryItemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inventoryItemId',
              lower: [],
              upper: [inventoryItemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inventoryItemId',
              lower: [inventoryItemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inventoryItemId',
              lower: [inventoryItemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inventoryItemId',
              lower: [],
              upper: [inventoryItemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TapHoaInventoryItemQueryFilter on QueryBuilder<TapHoaInventoryItem,
    TapHoaInventoryItem, QFilterCondition> {
  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      costPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      costPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      costPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      costPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      currentStockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      currentStockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      currentStockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      currentStockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inventoryItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inventoryItemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      inventoryItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inventoryItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      maxStockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      maxStockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      maxStockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      maxStockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      minStockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      minStockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      minStockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      minStockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterFilterCondition>
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

extension TapHoaInventoryItemQueryObject on QueryBuilder<TapHoaInventoryItem,
    TapHoaInventoryItem, QFilterCondition> {}

extension TapHoaInventoryItemQueryLinks on QueryBuilder<TapHoaInventoryItem,
    TapHoaInventoryItem, QFilterCondition> {}

extension TapHoaInventoryItemQuerySortBy
    on QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QSortBy> {
  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByCurrentStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByInventoryItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByInventoryItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByMaxStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByMaxStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByMinStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByMinStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TapHoaInventoryItemQuerySortThenBy
    on QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QSortThenBy> {
  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByCurrentStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByInventoryItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByInventoryItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByMaxStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByMaxStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByMinStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByMinStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TapHoaInventoryItemQueryWhereDistinct
    on QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct> {
  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costPrice');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentStock');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByInventoryItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inventoryItemId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByMaxStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStock');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByMinStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minStock');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByProductId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByProductName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TapHoaInventoryItemQueryProperty
    on QueryBuilder<TapHoaInventoryItem, TapHoaInventoryItem, QQueryProperty> {
  QueryBuilder<TapHoaInventoryItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TapHoaInventoryItem, double, QQueryOperations>
      costPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costPrice');
    });
  }

  QueryBuilder<TapHoaInventoryItem, double, QQueryOperations>
      currentStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentStock');
    });
  }

  QueryBuilder<TapHoaInventoryItem, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TapHoaInventoryItem, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TapHoaInventoryItem, String, QQueryOperations>
      inventoryItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inventoryItemId');
    });
  }

  QueryBuilder<TapHoaInventoryItem, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TapHoaInventoryItem, double, QQueryOperations>
      maxStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStock');
    });
  }

  QueryBuilder<TapHoaInventoryItem, double, QQueryOperations>
      minStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minStock');
    });
  }

  QueryBuilder<TapHoaInventoryItem, String, QQueryOperations>
      productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }

  QueryBuilder<TapHoaInventoryItem, String, QQueryOperations>
      productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<TapHoaInventoryItem, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }

  QueryBuilder<TapHoaInventoryItem, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TapHoaInventoryItem, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTapHoaInventoryTransactionCollection on Isar {
  IsarCollection<TapHoaInventoryTransaction> get tapHoaInventoryTransactions =>
      this.collection();
}

const TapHoaInventoryTransactionSchema = CollectionSchema(
  name: r'TapHoaInventoryTransaction',
  id: -4615278663425379754,
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
    r'inventoryItemId': PropertySchema(
      id: 2,
      name: r'inventoryItemId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'newStock': PropertySchema(
      id: 4,
      name: r'newStock',
      type: IsarType.double,
    ),
    r'note': PropertySchema(
      id: 5,
      name: r'note',
      type: IsarType.string,
    ),
    r'oldStock': PropertySchema(
      id: 6,
      name: r'oldStock',
      type: IsarType.double,
    ),
    r'productName': PropertySchema(
      id: 7,
      name: r'productName',
      type: IsarType.string,
    ),
    r'quantityChange': PropertySchema(
      id: 8,
      name: r'quantityChange',
      type: IsarType.double,
    ),
    r'referenceId': PropertySchema(
      id: 9,
      name: r'referenceId',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 10,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'transactionId': PropertySchema(
      id: 11,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 14,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _tapHoaInventoryTransactionEstimateSize,
  serialize: _tapHoaInventoryTransactionSerialize,
  deserialize: _tapHoaInventoryTransactionDeserialize,
  deserializeProp: _tapHoaInventoryTransactionDeserializeProp,
  idName: r'id',
  indexes: {
    r'transactionId': IndexSchema(
      id: 8561542235958051982,
      name: r'transactionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'transactionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tapHoaInventoryTransactionGetId,
  getLinks: _tapHoaInventoryTransactionGetLinks,
  attach: _tapHoaInventoryTransactionAttach,
  version: '3.1.0+1',
);

int _tapHoaInventoryTransactionEstimateSize(
  TapHoaInventoryTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.inventoryItemId.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.productName.length * 3;
  bytesCount += 3 + object.referenceId.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _tapHoaInventoryTransactionSerialize(
  TapHoaInventoryTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeString(offsets[2], object.inventoryItemId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeDouble(offsets[4], object.newStock);
  writer.writeString(offsets[5], object.note);
  writer.writeDouble(offsets[6], object.oldStock);
  writer.writeString(offsets[7], object.productName);
  writer.writeDouble(offsets[8], object.quantityChange);
  writer.writeString(offsets[9], object.referenceId);
  writer.writeDateTime(offsets[10], object.timestamp);
  writer.writeString(offsets[11], object.transactionId);
  writer.writeString(offsets[12], object.type);
  writer.writeDateTime(offsets[13], object.updatedAt);
  writer.writeLong(offsets[14], object.version);
}

TapHoaInventoryTransaction _tapHoaInventoryTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TapHoaInventoryTransaction();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.id = id;
  object.inventoryItemId = reader.readString(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.newStock = reader.readDouble(offsets[4]);
  object.note = reader.readString(offsets[5]);
  object.oldStock = reader.readDouble(offsets[6]);
  object.productName = reader.readString(offsets[7]);
  object.quantityChange = reader.readDouble(offsets[8]);
  object.referenceId = reader.readString(offsets[9]);
  object.timestamp = reader.readDateTime(offsets[10]);
  object.transactionId = reader.readString(offsets[11]);
  object.type = reader.readString(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  object.version = reader.readLong(offsets[14]);
  return object;
}

P _tapHoaInventoryTransactionDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tapHoaInventoryTransactionGetId(TapHoaInventoryTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tapHoaInventoryTransactionGetLinks(
    TapHoaInventoryTransaction object) {
  return [];
}

void _tapHoaInventoryTransactionAttach(
    IsarCollection<dynamic> col, Id id, TapHoaInventoryTransaction object) {
  object.id = id;
}

extension TapHoaInventoryTransactionByIndex
    on IsarCollection<TapHoaInventoryTransaction> {
  Future<TapHoaInventoryTransaction?> getByTransactionId(String transactionId) {
    return getByIndex(r'transactionId', [transactionId]);
  }

  TapHoaInventoryTransaction? getByTransactionIdSync(String transactionId) {
    return getByIndexSync(r'transactionId', [transactionId]);
  }

  Future<bool> deleteByTransactionId(String transactionId) {
    return deleteByIndex(r'transactionId', [transactionId]);
  }

  bool deleteByTransactionIdSync(String transactionId) {
    return deleteByIndexSync(r'transactionId', [transactionId]);
  }

  Future<List<TapHoaInventoryTransaction?>> getAllByTransactionId(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transactionId', values);
  }

  List<TapHoaInventoryTransaction?> getAllByTransactionIdSync(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'transactionId', values);
  }

  Future<int> deleteAllByTransactionId(List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'transactionId', values);
  }

  int deleteAllByTransactionIdSync(List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'transactionId', values);
  }

  Future<Id> putByTransactionId(TapHoaInventoryTransaction object) {
    return putByIndex(r'transactionId', object);
  }

  Id putByTransactionIdSync(TapHoaInventoryTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'transactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransactionId(
      List<TapHoaInventoryTransaction> objects) {
    return putAllByIndex(r'transactionId', objects);
  }

  List<Id> putAllByTransactionIdSync(List<TapHoaInventoryTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transactionId', objects, saveLinks: saveLinks);
  }
}

extension TapHoaInventoryTransactionQueryWhereSort on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QWhere> {
  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TapHoaInventoryTransactionQueryWhere on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QWhereClause> {
  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterWhereClause> transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionId',
        value: [transactionId],
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterWhereClause> transactionIdNotEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [],
              upper: [transactionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [transactionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [transactionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'transactionId',
              lower: [],
              upper: [transactionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TapHoaInventoryTransactionQueryFilter on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QFilterCondition> {
  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inventoryItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      inventoryItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inventoryItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      inventoryItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inventoryItemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inventoryItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> inventoryItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inventoryItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> newStockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'newStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> newStockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'newStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> newStockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'newStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> newStockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'newStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'note',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> oldStockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oldStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> oldStockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oldStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> oldStockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oldStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> oldStockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oldStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> quantityChangeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityChange',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> quantityChangeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityChange',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> quantityChangeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityChange',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> quantityChangeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityChange',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      referenceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      referenceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> referenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      transactionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      transactionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeEqualTo(
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeBetween(
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeStartsWith(
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeEndsWith(
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
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

extension TapHoaInventoryTransactionQueryObject on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QFilterCondition> {}

extension TapHoaInventoryTransactionQueryLinks on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QFilterCondition> {}

extension TapHoaInventoryTransactionQuerySortBy on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QSortBy> {
  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByInventoryItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByInventoryItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByNewStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByNewStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByOldStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByOldStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByQuantityChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityChange', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByQuantityChangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityChange', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TapHoaInventoryTransactionQuerySortThenBy on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QSortThenBy> {
  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByInventoryItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByInventoryItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inventoryItemId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByNewStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByNewStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'newStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByOldStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStock', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByOldStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oldStock', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByProductName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByProductNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productName', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByQuantityChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityChange', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByQuantityChangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityChange', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TapHoaInventoryTransactionQueryWhereDistinct on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QDistinct> {
  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByInventoryItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inventoryItemId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByNewStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'newStock');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByOldStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oldStock');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByProductName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByQuantityChange() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityChange');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByReferenceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, TapHoaInventoryTransaction,
      QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TapHoaInventoryTransactionQueryProperty on QueryBuilder<
    TapHoaInventoryTransaction, TapHoaInventoryTransaction, QQueryProperty> {
  QueryBuilder<TapHoaInventoryTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      inventoryItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inventoryItemId');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, double, QQueryOperations>
      newStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'newStock');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, double, QQueryOperations>
      oldStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oldStock');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      productNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productName');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, double, QQueryOperations>
      quantityChangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityChange');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      referenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceId');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, String, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TapHoaInventoryTransaction, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
