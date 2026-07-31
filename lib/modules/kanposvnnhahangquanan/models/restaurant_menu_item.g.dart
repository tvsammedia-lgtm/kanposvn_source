// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_menu_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantMenuItemCollection on Isar {
  IsarCollection<RestaurantMenuItem> get restaurantMenuItems =>
      this.collection();
}

const RestaurantMenuItemSchema = CollectionSchema(
  name: r'RestaurantMenuItem',
  id: -2460424494678099602,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'itemId': PropertySchema(
      id: 1,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 3,
      name: r'price',
      type: IsarType.double,
    ),
    r'recipe': PropertySchema(
      id: 4,
      name: r'recipe',
      type: IsarType.objectList,
      target: r'RestaurantRecipeItem',
    ),
    r'unit': PropertySchema(
      id: 5,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _restaurantMenuItemEstimateSize,
  serialize: _restaurantMenuItemSerialize,
  deserialize: _restaurantMenuItemDeserialize,
  deserializeProp: _restaurantMenuItemDeserializeProp,
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
  embeddedSchemas: {r'RestaurantRecipeItem': RestaurantRecipeItemSchema},
  getId: _restaurantMenuItemGetId,
  getLinks: _restaurantMenuItemGetLinks,
  attach: _restaurantMenuItemAttach,
  version: '3.1.0+1',
);

int _restaurantMenuItemEstimateSize(
  RestaurantMenuItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.recipe.length * 3;
  {
    final offsets = allOffsets[RestaurantRecipeItem]!;
    for (var i = 0; i < object.recipe.length; i++) {
      final value = object.recipe[i];
      bytesCount +=
          RestaurantRecipeItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _restaurantMenuItemSerialize(
  RestaurantMenuItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeString(offsets[1], object.itemId);
  writer.writeString(offsets[2], object.name);
  writer.writeDouble(offsets[3], object.price);
  writer.writeObjectList<RestaurantRecipeItem>(
    offsets[4],
    allOffsets,
    RestaurantRecipeItemSchema.serialize,
    object.recipe,
  );
  writer.writeString(offsets[5], object.unit);
}

RestaurantMenuItem _restaurantMenuItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantMenuItem();
  object.category = reader.readString(offsets[0]);
  object.id = id;
  object.itemId = reader.readString(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.price = reader.readDouble(offsets[3]);
  object.recipe = reader.readObjectList<RestaurantRecipeItem>(
        offsets[4],
        RestaurantRecipeItemSchema.deserialize,
        allOffsets,
        RestaurantRecipeItem(),
      ) ??
      [];
  object.unit = reader.readString(offsets[5]);
  return object;
}

P _restaurantMenuItemDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readObjectList<RestaurantRecipeItem>(
            offset,
            RestaurantRecipeItemSchema.deserialize,
            allOffsets,
            RestaurantRecipeItem(),
          ) ??
          []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _restaurantMenuItemGetId(RestaurantMenuItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _restaurantMenuItemGetLinks(
    RestaurantMenuItem object) {
  return [];
}

void _restaurantMenuItemAttach(
    IsarCollection<dynamic> col, Id id, RestaurantMenuItem object) {
  object.id = id;
}

extension RestaurantMenuItemByIndex on IsarCollection<RestaurantMenuItem> {
  Future<RestaurantMenuItem?> getByItemId(String itemId) {
    return getByIndex(r'itemId', [itemId]);
  }

  RestaurantMenuItem? getByItemIdSync(String itemId) {
    return getByIndexSync(r'itemId', [itemId]);
  }

  Future<bool> deleteByItemId(String itemId) {
    return deleteByIndex(r'itemId', [itemId]);
  }

  bool deleteByItemIdSync(String itemId) {
    return deleteByIndexSync(r'itemId', [itemId]);
  }

  Future<List<RestaurantMenuItem?>> getAllByItemId(List<String> itemIdValues) {
    final values = itemIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'itemId', values);
  }

  List<RestaurantMenuItem?> getAllByItemIdSync(List<String> itemIdValues) {
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

  Future<Id> putByItemId(RestaurantMenuItem object) {
    return putByIndex(r'itemId', object);
  }

  Id putByItemIdSync(RestaurantMenuItem object, {bool saveLinks = true}) {
    return putByIndexSync(r'itemId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByItemId(List<RestaurantMenuItem> objects) {
    return putAllByIndex(r'itemId', objects);
  }

  List<Id> putAllByItemIdSync(List<RestaurantMenuItem> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'itemId', objects, saveLinks: saveLinks);
  }
}

extension RestaurantMenuItemQueryWhereSort
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QWhere> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RestaurantMenuItemQueryWhere
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QWhereClause> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
      itemIdEqualTo(String itemId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'itemId',
        value: [itemId],
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterWhereClause>
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

extension RestaurantMenuItemQueryFilter
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QFilterCondition> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipe',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipe',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipe',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipe',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipe',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'recipe',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
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

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension RestaurantMenuItemQueryObject
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QFilterCondition> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterFilterCondition>
      recipeElement(FilterQuery<RestaurantRecipeItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'recipe');
    });
  }
}

extension RestaurantMenuItemQueryLinks
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QFilterCondition> {}

extension RestaurantMenuItemQuerySortBy
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QSortBy> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension RestaurantMenuItemQuerySortThenBy
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QSortThenBy> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension RestaurantMenuItemQueryWhereDistinct
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QDistinct> {
  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QDistinct>
      distinctByCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QDistinct>
      distinctByItemId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension RestaurantMenuItemQueryProperty
    on QueryBuilder<RestaurantMenuItem, RestaurantMenuItem, QQueryProperty> {
  QueryBuilder<RestaurantMenuItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantMenuItem, String, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<RestaurantMenuItem, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<RestaurantMenuItem, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RestaurantMenuItem, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<RestaurantMenuItem, List<RestaurantRecipeItem>, QQueryOperations>
      recipeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipe');
    });
  }

  QueryBuilder<RestaurantMenuItem, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RestaurantRecipeItemSchema = Schema(
  name: r'RestaurantRecipeItem',
  id: 1763461688463003263,
  properties: {
    r'ingredientId': PropertySchema(
      id: 0,
      name: r'ingredientId',
      type: IsarType.string,
    ),
    r'ingredientName': PropertySchema(
      id: 1,
      name: r'ingredientName',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.double,
    )
  },
  estimateSize: _restaurantRecipeItemEstimateSize,
  serialize: _restaurantRecipeItemSerialize,
  deserialize: _restaurantRecipeItemDeserialize,
  deserializeProp: _restaurantRecipeItemDeserializeProp,
);

int _restaurantRecipeItemEstimateSize(
  RestaurantRecipeItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ingredientId.length * 3;
  bytesCount += 3 + object.ingredientName.length * 3;
  return bytesCount;
}

void _restaurantRecipeItemSerialize(
  RestaurantRecipeItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ingredientId);
  writer.writeString(offsets[1], object.ingredientName);
  writer.writeDouble(offsets[2], object.quantity);
}

RestaurantRecipeItem _restaurantRecipeItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantRecipeItem();
  object.ingredientId = reader.readString(offsets[0]);
  object.ingredientName = reader.readString(offsets[1]);
  object.quantity = reader.readDouble(offsets[2]);
  return object;
}

P _restaurantRecipeItemDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RestaurantRecipeItemQueryFilter on QueryBuilder<RestaurantRecipeItem,
    RestaurantRecipeItem, QFilterCondition> {
  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ingredientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ingredientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
          QAfterFilterCondition>
      ingredientIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ingredientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
          QAfterFilterCondition>
      ingredientIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ingredientId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ingredientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ingredientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
          QAfterFilterCondition>
      ingredientNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ingredientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
          QAfterFilterCondition>
      ingredientNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ingredientName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> ingredientNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantRecipeItem, RestaurantRecipeItem,
      QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RestaurantRecipeItemQueryObject on QueryBuilder<RestaurantRecipeItem,
    RestaurantRecipeItem, QFilterCondition> {}
