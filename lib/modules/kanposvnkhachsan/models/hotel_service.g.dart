// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_service.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelServiceItemCollection on Isar {
  IsarCollection<HotelServiceItem> get hotelServiceItems => this.collection();
}

const HotelServiceItemSchema = CollectionSchema(
  name: r'HotelServiceItem',
  id: 4665041821674416463,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'isInventoryTracked': PropertySchema(
      id: 1,
      name: r'isInventoryTracked',
      type: IsarType.bool,
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
    r'price': PropertySchema(
      id: 4,
      name: r'price',
      type: IsarType.double,
    )
  },
  estimateSize: _hotelServiceItemEstimateSize,
  serialize: _hotelServiceItemSerialize,
  deserialize: _hotelServiceItemDeserialize,
  deserializeProp: _hotelServiceItemDeserializeProp,
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
  getId: _hotelServiceItemGetId,
  getLinks: _hotelServiceItemGetLinks,
  attach: _hotelServiceItemAttach,
  version: '3.1.0+1',
);

int _hotelServiceItemEstimateSize(
  HotelServiceItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  return bytesCount;
}

void _hotelServiceItemSerialize(
  HotelServiceItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeBool(offsets[1], object.isInventoryTracked);
  writer.writeString(offsets[2], object.itemId);
  writer.writeString(offsets[3], object.itemName);
  writer.writeDouble(offsets[4], object.price);
}

HotelServiceItem _hotelServiceItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelServiceItem();
  object.category = reader.readString(offsets[0]);
  object.id = id;
  object.isInventoryTracked = reader.readBool(offsets[1]);
  object.itemId = reader.readString(offsets[2]);
  object.itemName = reader.readString(offsets[3]);
  object.price = reader.readDouble(offsets[4]);
  return object;
}

P _hotelServiceItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hotelServiceItemGetId(HotelServiceItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelServiceItemGetLinks(HotelServiceItem object) {
  return [];
}

void _hotelServiceItemAttach(
    IsarCollection<dynamic> col, Id id, HotelServiceItem object) {
  object.id = id;
}

extension HotelServiceItemByIndex on IsarCollection<HotelServiceItem> {
  Future<HotelServiceItem?> getByItemId(String itemId) {
    return getByIndex(r'itemId', [itemId]);
  }

  HotelServiceItem? getByItemIdSync(String itemId) {
    return getByIndexSync(r'itemId', [itemId]);
  }

  Future<bool> deleteByItemId(String itemId) {
    return deleteByIndex(r'itemId', [itemId]);
  }

  bool deleteByItemIdSync(String itemId) {
    return deleteByIndexSync(r'itemId', [itemId]);
  }

  Future<List<HotelServiceItem?>> getAllByItemId(List<String> itemIdValues) {
    final values = itemIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'itemId', values);
  }

  List<HotelServiceItem?> getAllByItemIdSync(List<String> itemIdValues) {
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

  Future<Id> putByItemId(HotelServiceItem object) {
    return putByIndex(r'itemId', object);
  }

  Id putByItemIdSync(HotelServiceItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'itemId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByItemId(List<HotelServiceItem> objects) {
    return putAllByIndex(r'itemId', objects);
  }

  List<Id> putAllByItemIdSync(List<HotelServiceItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'itemId', objects, saveLinks: saveLinks);
  }
}

extension HotelServiceItemQueryWhereSort
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QWhere> {
  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelServiceItemQueryWhere
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QWhereClause> {
  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause> idBetween(
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause>
      itemIdEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterWhereClause>
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

extension HotelServiceItemQueryFilter
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QFilterCondition> {
  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      isInventoryTrackedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInventoryTracked',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
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

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterFilterCondition>
      priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension HotelServiceItemQueryObject
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QFilterCondition> {}

extension HotelServiceItemQueryLinks
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QFilterCondition> {}

extension HotelServiceItemQuerySortBy
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QSortBy> {
  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByIsInventoryTracked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInventoryTracked', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByIsInventoryTrackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInventoryTracked', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }
}

extension HotelServiceItemQuerySortThenBy
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QSortThenBy> {
  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByIsInventoryTracked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInventoryTracked', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByIsInventoryTrackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInventoryTracked', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }
}

extension HotelServiceItemQueryWhereDistinct
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QDistinct> {
  QueryBuilder<HotelServiceItem, HotelServiceItem, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QDistinct>
      distinctByIsInventoryTracked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInventoryTracked');
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QDistinct> distinctByItemId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QDistinct>
      distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelServiceItem, HotelServiceItem, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }
}

extension HotelServiceItemQueryProperty
    on QueryBuilder<HotelServiceItem, HotelServiceItem, QQueryProperty> {
  QueryBuilder<HotelServiceItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelServiceItem, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<HotelServiceItem, bool, QQueryOperations>
      isInventoryTrackedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInventoryTracked');
    });
  }

  QueryBuilder<HotelServiceItem, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<HotelServiceItem, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<HotelServiceItem, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoomServiceOrderItemCollection on Isar {
  IsarCollection<RoomServiceOrderItem> get roomServiceOrderItems =>
      this.collection();
}

const RoomServiceOrderItemSchema = CollectionSchema(
  name: r'RoomServiceOrderItem',
  id: -7537596313150205116,
  properties: {
    r'isPaid': PropertySchema(
      id: 0,
      name: r'isPaid',
      type: IsarType.bool,
    ),
    r'orderItemId': PropertySchema(
      id: 1,
      name: r'orderItemId',
      type: IsarType.string,
    ),
    r'orderTime': PropertySchema(
      id: 2,
      name: r'orderTime',
      type: IsarType.dateTime,
    ),
    r'quantity': PropertySchema(
      id: 3,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'totalPrice': PropertySchema(
      id: 4,
      name: r'totalPrice',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 5,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _roomServiceOrderItemEstimateSize,
  serialize: _roomServiceOrderItemSerialize,
  deserialize: _roomServiceOrderItemDeserialize,
  deserializeProp: _roomServiceOrderItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'orderItemId': IndexSchema(
      id: 4154966471582948578,
      name: r'orderItemId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'orderItemId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'checkIn': LinkSchema(
      id: 4978449421904015293,
      name: r'checkIn',
      target: r'RoomCheckIn',
      single: true,
    ),
    r'serviceItem': LinkSchema(
      id: -8817996741662319131,
      name: r'serviceItem',
      target: r'HotelServiceItem',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _roomServiceOrderItemGetId,
  getLinks: _roomServiceOrderItemGetLinks,
  attach: _roomServiceOrderItemAttach,
  version: '3.1.0+1',
);

int _roomServiceOrderItemEstimateSize(
  RoomServiceOrderItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.orderItemId.length * 3;
  return bytesCount;
}

void _roomServiceOrderItemSerialize(
  RoomServiceOrderItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isPaid);
  writer.writeString(offsets[1], object.orderItemId);
  writer.writeDateTime(offsets[2], object.orderTime);
  writer.writeLong(offsets[3], object.quantity);
  writer.writeDouble(offsets[4], object.totalPrice);
  writer.writeDouble(offsets[5], object.unitPrice);
}

RoomServiceOrderItem _roomServiceOrderItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoomServiceOrderItem();
  object.id = id;
  object.isPaid = reader.readBool(offsets[0]);
  object.orderItemId = reader.readString(offsets[1]);
  object.orderTime = reader.readDateTime(offsets[2]);
  object.quantity = reader.readLong(offsets[3]);
  object.totalPrice = reader.readDouble(offsets[4]);
  object.unitPrice = reader.readDouble(offsets[5]);
  return object;
}

P _roomServiceOrderItemDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _roomServiceOrderItemGetId(RoomServiceOrderItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _roomServiceOrderItemGetLinks(
    RoomServiceOrderItem object) {
  return [object.checkIn, object.serviceItem];
}

void _roomServiceOrderItemAttach(
    IsarCollection<dynamic> col, Id id, RoomServiceOrderItem object) {
  object.id = id;
  object.checkIn
      .attach(col, col.isar.collection<RoomCheckIn>(), r'checkIn', id);
  object.serviceItem
      .attach(col, col.isar.collection<HotelServiceItem>(), r'serviceItem', id);
}

extension RoomServiceOrderItemByIndex on IsarCollection<RoomServiceOrderItem> {
  Future<RoomServiceOrderItem?> getByOrderItemId(String orderItemId) {
    return getByIndex(r'orderItemId', [orderItemId]);
  }

  RoomServiceOrderItem? getByOrderItemIdSync(String orderItemId) {
    return getByIndexSync(r'orderItemId', [orderItemId]);
  }

  Future<bool> deleteByOrderItemId(String orderItemId) {
    return deleteByIndex(r'orderItemId', [orderItemId]);
  }

  bool deleteByOrderItemIdSync(String orderItemId) {
    return deleteByIndexSync(r'orderItemId', [orderItemId]);
  }

  Future<List<RoomServiceOrderItem?>> getAllByOrderItemId(
      List<String> orderItemIdValues) {
    final values = orderItemIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'orderItemId', values);
  }

  List<RoomServiceOrderItem?> getAllByOrderItemIdSync(
      List<String> orderItemIdValues) {
    final values = orderItemIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'orderItemId', values);
  }

  Future<int> deleteAllByOrderItemId(List<String> orderItemIdValues) {
    final values = orderItemIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'orderItemId', values);
  }

  int deleteAllByOrderItemIdSync(List<String> orderItemIdValues) {
    final values = orderItemIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'orderItemId', values);
  }

  Future<Id> putByOrderItemId(RoomServiceOrderItem object) {
    return putByIndex(r'orderItemId', object);
  }

  Id putByOrderItemIdSync(RoomServiceOrderItem object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'orderItemId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderItemId(List<RoomServiceOrderItem> objects) {
    return putAllByIndex(r'orderItemId', objects);
  }

  List<Id> putAllByOrderItemIdSync(List<RoomServiceOrderItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'orderItemId', objects, saveLinks: saveLinks);
  }
}

extension RoomServiceOrderItemQueryWhereSort
    on QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QWhere> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoomServiceOrderItemQueryWhere
    on QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QWhereClause> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
      orderItemIdEqualTo(String orderItemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderItemId',
        value: [orderItemId],
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterWhereClause>
      orderItemIdNotEqualTo(String orderItemId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderItemId',
              lower: [],
              upper: [orderItemId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderItemId',
              lower: [orderItemId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderItemId',
              lower: [orderItemId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'orderItemId',
              lower: [],
              upper: [orderItemId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RoomServiceOrderItemQueryFilter on QueryBuilder<RoomServiceOrderItem,
    RoomServiceOrderItem, QFilterCondition> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> isPaidEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderItemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'orderItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'orderItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
          QAfterFilterCondition>
      orderItemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderItemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
          QAfterFilterCondition>
      orderItemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderItemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderItemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderItemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> orderTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> totalPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> totalPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> totalPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> totalPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
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

extension RoomServiceOrderItemQueryObject on QueryBuilder<RoomServiceOrderItem,
    RoomServiceOrderItem, QFilterCondition> {}

extension RoomServiceOrderItemQueryLinks on QueryBuilder<RoomServiceOrderItem,
    RoomServiceOrderItem, QFilterCondition> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> checkIn(FilterQuery<RoomCheckIn> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'checkIn');
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> checkInIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'checkIn', 0, true, 0, true);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> serviceItem(FilterQuery<HotelServiceItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'serviceItem');
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem,
      QAfterFilterCondition> serviceItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'serviceItem', 0, true, 0, true);
    });
  }
}

extension RoomServiceOrderItemQuerySortBy
    on QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QSortBy> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByOrderItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderItemId', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByOrderItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderItemId', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension RoomServiceOrderItemQuerySortThenBy
    on QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QSortThenBy> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByIsPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPaid', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByOrderItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderItemId', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByOrderItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderItemId', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByOrderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderTime', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension RoomServiceOrderItemQueryWhereDistinct
    on QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct> {
  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct>
      distinctByIsPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPaid');
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct>
      distinctByOrderItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderItemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct>
      distinctByOrderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderTime');
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct>
      distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }

  QueryBuilder<RoomServiceOrderItem, RoomServiceOrderItem, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension RoomServiceOrderItemQueryProperty on QueryBuilder<
    RoomServiceOrderItem, RoomServiceOrderItem, QQueryProperty> {
  QueryBuilder<RoomServiceOrderItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RoomServiceOrderItem, bool, QQueryOperations> isPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPaid');
    });
  }

  QueryBuilder<RoomServiceOrderItem, String, QQueryOperations>
      orderItemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderItemId');
    });
  }

  QueryBuilder<RoomServiceOrderItem, DateTime, QQueryOperations>
      orderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderTime');
    });
  }

  QueryBuilder<RoomServiceOrderItem, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<RoomServiceOrderItem, double, QQueryOperations>
      totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }

  QueryBuilder<RoomServiceOrderItem, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}
