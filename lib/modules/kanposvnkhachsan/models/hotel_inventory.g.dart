// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_inventory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelInventoryItemCollection on Isar {
  IsarCollection<HotelInventoryItem> get hotelInventoryItems =>
      this.collection();
}

const HotelInventoryItemSchema = CollectionSchema(
  name: r'HotelInventoryItem',
  id: 4202565474056909076,
  properties: {
    r'costPrice': PropertySchema(
      id: 0,
      name: r'costPrice',
      type: IsarType.double,
    ),
    r'currentStock': PropertySchema(
      id: 1,
      name: r'currentStock',
      type: IsarType.long,
    ),
    r'itemId': PropertySchema(
      id: 2,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 3,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'minStock': PropertySchema(
      id: 4,
      name: r'minStock',
      type: IsarType.long,
    ),
    r'sku': PropertySchema(
      id: 5,
      name: r'sku',
      type: IsarType.string,
    ),
    r'unit': PropertySchema(
      id: 6,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _hotelInventoryItemEstimateSize,
  serialize: _hotelInventoryItemSerialize,
  deserialize: _hotelInventoryItemDeserialize,
  deserializeProp: _hotelInventoryItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'itemId': IndexSchema(
      id: -5342806140158601489,
      name: r'itemId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'itemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _hotelInventoryItemGetId,
  getLinks: _hotelInventoryItemGetLinks,
  attach: _hotelInventoryItemAttach,
  version: '3.1.0+1',
);

int _hotelInventoryItemEstimateSize(
  HotelInventoryItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.sku.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _hotelInventoryItemSerialize(
  HotelInventoryItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.costPrice);
  writer.writeLong(offsets[1], object.currentStock);
  writer.writeString(offsets[2], object.itemId);
  writer.writeString(offsets[3], object.itemName);
  writer.writeLong(offsets[4], object.minStock);
  writer.writeString(offsets[5], object.sku);
  writer.writeString(offsets[6], object.unit);
}

HotelInventoryItem _hotelInventoryItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelInventoryItem();
  object.costPrice = reader.readDouble(offsets[0]);
  object.currentStock = reader.readLong(offsets[1]);
  object.id = id;
  object.itemId = reader.readString(offsets[2]);
  object.itemName = reader.readString(offsets[3]);
  object.minStock = reader.readLong(offsets[4]);
  object.sku = reader.readString(offsets[5]);
  object.unit = reader.readString(offsets[6]);
  return object;
}

P _hotelInventoryItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hotelInventoryItemGetId(HotelInventoryItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelInventoryItemGetLinks(
    HotelInventoryItem object) {
  return [];
}

void _hotelInventoryItemAttach(
    IsarCollection<dynamic> col, Id id, HotelInventoryItem object) {
  object.id = id;
}

extension HotelInventoryItemByIndex on IsarCollection<HotelInventoryItem> {
  Future<HotelInventoryItem?> getByItemId(String itemId) {
    return getByIndex(r'itemId', [itemId]);
  }

  HotelInventoryItem? getByItemIdSync(String itemId) {
    return getByIndexSync(r'itemId', [itemId]);
  }

  Future<bool> deleteByItemId(String itemId) {
    return deleteByIndex(r'itemId', [itemId]);
  }

  bool deleteByItemIdSync(String itemId) {
    return deleteByIndexSync(r'itemId', [itemId]);
  }

  Future<List<HotelInventoryItem?>> getAllByItemId(List<String> itemIdValues) {
    final values = itemIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'itemId', values);
  }

  List<HotelInventoryItem?> getAllByItemIdSync(List<String> itemIdValues) {
    final values = itemIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'itemId', values);
  }

  Future<int> deleteAllByItemId(List<String> itemIdValues) {
    final values = itemIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'itemId', values);
  }

  int deleteAllByItemIdSync(List<String> itemIdValues) {
    final values = itemIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'itemId', values);
  }

  Future<Id> putByItemId(HotelInventoryItem object) {
    return putByIndex(r'itemId', object);
  }

  Id putByItemIdSync(HotelInventoryItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'itemId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByItemId(List<HotelInventoryItem> objects) {
    return putAllByIndex(r'itemId', objects);
  }

  List<Id> putAllByItemIdSync(List<HotelInventoryItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'itemId', objects, saveLinks: saveLinks);
  }
}

extension HotelInventoryItemQueryWhereSort
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QWhere> {
  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelInventoryItemQueryWhere
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QWhereClause> {
  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
      itemIdEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterWhereClause>
      itemIdNotEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [itemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'itemId',
              lower: [],
              upper: [itemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HotelInventoryItemQueryFilter
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QFilterCondition> {
  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      currentStockEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentStock',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      currentStockGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentStock',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      currentStockLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentStock',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      currentStockBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      minStockEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minStock',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      minStockGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minStock',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      minStockLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minStock',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      minStockBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sku',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sku',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sku',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sku',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      skuIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sku',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
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

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension HotelInventoryItemQueryObject
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QFilterCondition> {}

extension HotelInventoryItemQueryLinks
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QFilterCondition> {}

extension HotelInventoryItemQuerySortBy
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QSortBy> {
  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByCurrentStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByMinStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByMinStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortBySku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortBySkuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension HotelInventoryItemQuerySortThenBy
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QSortThenBy> {
  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'costPrice', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByCurrentStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByMinStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByMinStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStock', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenBySku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenBySkuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sku', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension HotelInventoryItemQueryWhereDistinct
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct> {
  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct>
      distinctByCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'costPrice');
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct>
      distinctByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentStock');
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct>
      distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct>
      distinctByMinStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minStock');
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct> distinctBySku(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sku', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelInventoryItem, HotelInventoryItem, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension HotelInventoryItemQueryProperty
    on QueryBuilder<HotelInventoryItem, HotelInventoryItem, QQueryProperty> {
  QueryBuilder<HotelInventoryItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelInventoryItem, double, QQueryOperations>
      costPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'costPrice');
    });
  }

  QueryBuilder<HotelInventoryItem, int, QQueryOperations>
      currentStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentStock');
    });
  }

  QueryBuilder<HotelInventoryItem, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<HotelInventoryItem, String, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<HotelInventoryItem, int, QQueryOperations> minStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minStock');
    });
  }

  QueryBuilder<HotelInventoryItem, String, QQueryOperations> skuProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sku');
    });
  }

  QueryBuilder<HotelInventoryItem, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelInventoryTransactionCollection on Isar {
  IsarCollection<HotelInventoryTransaction> get hotelInventoryTransactions =>
      this.collection();
}

const HotelInventoryTransactionSchema = CollectionSchema(
  name: r'HotelInventoryTransaction',
  id: -1417010441978394678,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'note': PropertySchema(
      id: 1,
      name: r'note',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'referenceInfo': PropertySchema(
      id: 3,
      name: r'referenceInfo',
      type: IsarType.string,
    ),
    r'transactionId': PropertySchema(
      id: 4,
      name: r'transactionId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _HotelInventoryTransactiontypeEnumValueMap,
    ),
    r'unitPrice': PropertySchema(
      id: 6,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _hotelInventoryTransactionEstimateSize,
  serialize: _hotelInventoryTransactionSerialize,
  deserialize: _hotelInventoryTransactionDeserialize,
  deserializeProp: _hotelInventoryTransactionDeserializeProp,
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
  links: {
    r'item': LinkSchema(
      id: 9209740950116450439,
      name: r'item',
      target: r'HotelInventoryItem',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _hotelInventoryTransactionGetId,
  getLinks: _hotelInventoryTransactionGetLinks,
  attach: _hotelInventoryTransactionAttach,
  version: '3.1.0+1',
);

int _hotelInventoryTransactionEstimateSize(
  HotelInventoryTransaction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.referenceInfo.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _hotelInventoryTransactionSerialize(
  HotelInventoryTransaction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.note);
  writer.writeLong(offsets[2], object.quantity);
  writer.writeString(offsets[3], object.referenceInfo);
  writer.writeString(offsets[4], object.transactionId);
  writer.writeByte(offsets[5], object.type.index);
  writer.writeDouble(offsets[6], object.unitPrice);
}

HotelInventoryTransaction _hotelInventoryTransactionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelInventoryTransaction();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.note = reader.readString(offsets[1]);
  object.quantity = reader.readLong(offsets[2]);
  object.referenceInfo = reader.readString(offsets[3]);
  object.transactionId = reader.readString(offsets[4]);
  object.type = _HotelInventoryTransactiontypeValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      InventoryTransactionType.IMPORT;
  object.unitPrice = reader.readDouble(offsets[6]);
  return object;
}

P _hotelInventoryTransactionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_HotelInventoryTransactiontypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          InventoryTransactionType.IMPORT) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HotelInventoryTransactiontypeEnumValueMap = {
  'IMPORT': 0,
  'EXPORT': 1,
  'ADJUSTMENT': 2,
};
const _HotelInventoryTransactiontypeValueEnumMap = {
  0: InventoryTransactionType.IMPORT,
  1: InventoryTransactionType.EXPORT,
  2: InventoryTransactionType.ADJUSTMENT,
};

Id _hotelInventoryTransactionGetId(HotelInventoryTransaction object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelInventoryTransactionGetLinks(
    HotelInventoryTransaction object) {
  return [object.item];
}

void _hotelInventoryTransactionAttach(
    IsarCollection<dynamic> col, Id id, HotelInventoryTransaction object) {
  object.id = id;
  object.item
      .attach(col, col.isar.collection<HotelInventoryItem>(), r'item', id);
}

extension HotelInventoryTransactionByIndex
    on IsarCollection<HotelInventoryTransaction> {
  Future<HotelInventoryTransaction?> getByTransactionId(String transactionId) {
    return getByIndex(r'transactionId', [transactionId]);
  }

  HotelInventoryTransaction? getByTransactionIdSync(String transactionId) {
    return getByIndexSync(r'transactionId', [transactionId]);
  }

  Future<bool> deleteByTransactionId(String transactionId) {
    return deleteByIndex(r'transactionId', [transactionId]);
  }

  bool deleteByTransactionIdSync(String transactionId) {
    return deleteByIndexSync(r'transactionId', [transactionId]);
  }

  Future<List<HotelInventoryTransaction?>> getAllByTransactionId(
      List<String> transactionIdValues) {
    final values = transactionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'transactionId', values);
  }

  List<HotelInventoryTransaction?> getAllByTransactionIdSync(
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

  Future<Id> putByTransactionId(HotelInventoryTransaction object) {
    return putByIndex(r'transactionId', object);
  }

  Id putByTransactionIdSync(HotelInventoryTransaction object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'transactionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTransactionId(
      List<HotelInventoryTransaction> objects) {
    return putAllByIndex(r'transactionId', objects);
  }

  List<Id> putAllByTransactionIdSync(List<HotelInventoryTransaction> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'transactionId', objects, saveLinks: saveLinks);
  }
}

extension HotelInventoryTransactionQueryWhereSort on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QWhere> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelInventoryTransactionQueryWhere on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QWhereClause> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterWhereClause> transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'transactionId',
        value: [transactionId],
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

extension HotelInventoryTransactionQueryFilter on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QFilterCondition> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
          QAfterFilterCondition>
      referenceInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
          QAfterFilterCondition>
      referenceInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> referenceInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactionId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> typeEqualTo(InventoryTransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> typeGreaterThan(
    InventoryTransactionType value, {
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> typeLessThan(
    InventoryTransactionType value, {
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> typeBetween(
    InventoryTransactionType lower,
    InventoryTransactionType upper, {
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

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> unitPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> unitPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> unitPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> unitPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension HotelInventoryTransactionQueryObject on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QFilterCondition> {}

extension HotelInventoryTransactionQueryLinks on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QFilterCondition> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> item(FilterQuery<HotelInventoryItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'item');
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterFilterCondition> itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'item', 0, true, 0, true);
    });
  }
}

extension HotelInventoryTransactionQuerySortBy on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QSortBy> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByReferenceInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceInfo', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByReferenceInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceInfo', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension HotelInventoryTransactionQuerySortThenBy on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QSortThenBy> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByReferenceInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceInfo', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByReferenceInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceInfo', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction,
      QAfterSortBy> thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension HotelInventoryTransactionQueryWhereDistinct on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QDistinct> {
  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByReferenceInfo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceInfo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<HotelInventoryTransaction, HotelInventoryTransaction, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension HotelInventoryTransactionQueryProperty on QueryBuilder<
    HotelInventoryTransaction, HotelInventoryTransaction, QQueryProperty> {
  QueryBuilder<HotelInventoryTransaction, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelInventoryTransaction, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<HotelInventoryTransaction, String, QQueryOperations>
      noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<HotelInventoryTransaction, int, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<HotelInventoryTransaction, String, QQueryOperations>
      referenceInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceInfo');
    });
  }

  QueryBuilder<HotelInventoryTransaction, String, QQueryOperations>
      transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }

  QueryBuilder<HotelInventoryTransaction, InventoryTransactionType,
      QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<HotelInventoryTransaction, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}
