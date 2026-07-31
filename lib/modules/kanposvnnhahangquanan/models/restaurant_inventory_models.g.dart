// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_inventory_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantIngredientCollection on Isar {
  IsarCollection<RestaurantIngredient> get restaurantIngredients =>
      this.collection();
}

const RestaurantIngredientSchema = CollectionSchema(
  name: r'RestaurantIngredient',
  id: -3169808264292293857,
  properties: {
    r'ingredientId': PropertySchema(
      id: 0,
      name: r'ingredientId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'stock': PropertySchema(
      id: 2,
      name: r'stock',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 3,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _restaurantIngredientEstimateSize,
  serialize: _restaurantIngredientSerialize,
  deserialize: _restaurantIngredientDeserialize,
  deserializeProp: _restaurantIngredientDeserializeProp,
  idName: r'id',
  indexes: {
    r'ingredientId': IndexSchema(
      id: 2486648196709662311,
      name: r'ingredientId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'ingredientId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _restaurantIngredientGetId,
  getLinks: _restaurantIngredientGetLinks,
  attach: _restaurantIngredientAttach,
  version: '3.1.0+1',
);

int _restaurantIngredientEstimateSize(
  RestaurantIngredient object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ingredientId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _restaurantIngredientSerialize(
  RestaurantIngredient object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ingredientId);
  writer.writeString(offsets[1], object.name);
  writer.writeDouble(offsets[2], object.stock);
  writer.writeString(offsets[3], object.unit);
}

RestaurantIngredient _restaurantIngredientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantIngredient();
  object.id = id;
  object.ingredientId = reader.readString(offsets[0]);
  object.name = reader.readString(offsets[1]);
  object.stock = reader.readDouble(offsets[2]);
  object.unit = reader.readString(offsets[3]);
  return object;
}

P _restaurantIngredientDeserializeProp<P>(
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
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _restaurantIngredientGetId(RestaurantIngredient object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _restaurantIngredientGetLinks(
    RestaurantIngredient object) {
  return [];
}

void _restaurantIngredientAttach(
    IsarCollection<dynamic> col, Id id, RestaurantIngredient object) {
  object.id = id;
}

extension RestaurantIngredientByIndex on IsarCollection<RestaurantIngredient> {
  Future<RestaurantIngredient?> getByIngredientId(String ingredientId) {
    return getByIndex(r'ingredientId', [ingredientId]);
  }

  RestaurantIngredient? getByIngredientIdSync(String ingredientId) {
    return getByIndexSync(r'ingredientId', [ingredientId]);
  }

  Future<bool> deleteByIngredientId(String ingredientId) {
    return deleteByIndex(r'ingredientId', [ingredientId]);
  }

  bool deleteByIngredientIdSync(String ingredientId) {
    return deleteByIndexSync(r'ingredientId', [ingredientId]);
  }

  Future<List<RestaurantIngredient?>> getAllByIngredientId(
      List<String> ingredientIdValues) {
    final values = ingredientIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ingredientId', values);
  }

  List<RestaurantIngredient?> getAllByIngredientIdSync(
      List<String> ingredientIdValues) {
    final values = ingredientIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'ingredientId', values);
  }

  Future<int> deleteAllByIngredientId(List<String> ingredientIdValues) {
    final values = ingredientIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'ingredientId', values);
  }

  int deleteAllByIngredientIdSync(List<String> ingredientIdValues) {
    final values = ingredientIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'ingredientId', values);
  }

  Future<Id> putByIngredientId(RestaurantIngredient object) {
    return putByIndex(r'ingredientId', object);
  }

  Id putByIngredientIdSync(RestaurantIngredient object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'ingredientId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIngredientId(List<RestaurantIngredient> objects) {
    return putAllByIndex(r'ingredientId', objects);
  }

  List<Id> putAllByIngredientIdSync(List<RestaurantIngredient> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ingredientId', objects, saveLinks: saveLinks);
  }
}

extension RestaurantIngredientQueryWhereSort
    on QueryBuilder<RestaurantIngredient, RestaurantIngredient, QWhere> {
  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RestaurantIngredientQueryWhere
    on QueryBuilder<RestaurantIngredient, RestaurantIngredient, QWhereClause> {
  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
      ingredientIdEqualTo(String ingredientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ingredientId',
        value: [ingredientId],
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterWhereClause>
      ingredientIdNotEqualTo(String ingredientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ingredientId',
              lower: [],
              upper: [ingredientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ingredientId',
              lower: [ingredientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ingredientId',
              lower: [ingredientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ingredientId',
              lower: [],
              upper: [ingredientId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RestaurantIngredientQueryFilter on QueryBuilder<RestaurantIngredient,
    RestaurantIngredient, QFilterCondition> {
  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> ingredientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> ingredientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> stockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> stockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> stockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> stockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitEqualTo(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitGreaterThan(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitLessThan(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitBetween(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitStartsWith(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitEndsWith(
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

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
          QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
          QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient,
      QAfterFilterCondition> unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension RestaurantIngredientQueryObject on QueryBuilder<RestaurantIngredient,
    RestaurantIngredient, QFilterCondition> {}

extension RestaurantIngredientQueryLinks on QueryBuilder<RestaurantIngredient,
    RestaurantIngredient, QFilterCondition> {}

extension RestaurantIngredientQuerySortBy
    on QueryBuilder<RestaurantIngredient, RestaurantIngredient, QSortBy> {
  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByIngredientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension RestaurantIngredientQuerySortThenBy
    on QueryBuilder<RestaurantIngredient, RestaurantIngredient, QSortThenBy> {
  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByIngredientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stock', Sort.desc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension RestaurantIngredientQueryWhereDistinct
    on QueryBuilder<RestaurantIngredient, RestaurantIngredient, QDistinct> {
  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QDistinct>
      distinctByIngredientId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QDistinct>
      distinctByStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stock');
    });
  }

  QueryBuilder<RestaurantIngredient, RestaurantIngredient, QDistinct>
      distinctByUnit({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension RestaurantIngredientQueryProperty on QueryBuilder<
    RestaurantIngredient, RestaurantIngredient, QQueryProperty> {
  QueryBuilder<RestaurantIngredient, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantIngredient, String, QQueryOperations>
      ingredientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientId');
    });
  }

  QueryBuilder<RestaurantIngredient, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<RestaurantIngredient, double, QQueryOperations> stockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stock');
    });
  }

  QueryBuilder<RestaurantIngredient, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantInventoryTxCollection on Isar {
  IsarCollection<RestaurantInventoryTx> get restaurantInventoryTxs =>
      this.collection();
}

const RestaurantInventoryTxSchema = CollectionSchema(
  name: r'RestaurantInventoryTx',
  id: -480906868539775448,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'ingredientId': PropertySchema(
      id: 1,
      name: r'ingredientId',
      type: IsarType.string,
    ),
    r'ingredientName': PropertySchema(
      id: 2,
      name: r'ingredientName',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 3,
      name: r'note',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _RestaurantInventoryTxtypeEnumValueMap,
    )
  },
  estimateSize: _restaurantInventoryTxEstimateSize,
  serialize: _restaurantInventoryTxSerialize,
  deserialize: _restaurantInventoryTxDeserialize,
  deserializeProp: _restaurantInventoryTxDeserializeProp,
  idName: r'id',
  indexes: {
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
  getId: _restaurantInventoryTxGetId,
  getLinks: _restaurantInventoryTxGetLinks,
  attach: _restaurantInventoryTxAttach,
  version: '3.1.0+1',
);

int _restaurantInventoryTxEstimateSize(
  RestaurantInventoryTx object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ingredientId.length * 3;
  bytesCount += 3 + object.ingredientName.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _restaurantInventoryTxSerialize(
  RestaurantInventoryTx object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.ingredientId);
  writer.writeString(offsets[2], object.ingredientName);
  writer.writeString(offsets[3], object.note);
  writer.writeDouble(offsets[4], object.quantity);
  writer.writeByte(offsets[5], object.type.index);
}

RestaurantInventoryTx _restaurantInventoryTxDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantInventoryTx();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.ingredientId = reader.readString(offsets[1]);
  object.ingredientName = reader.readString(offsets[2]);
  object.note = reader.readString(offsets[3]);
  object.quantity = reader.readDouble(offsets[4]);
  object.type = _RestaurantInventoryTxtypeValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      RestaurantInventoryTxType.IMPORT;
  return object;
}

P _restaurantInventoryTxDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (_RestaurantInventoryTxtypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RestaurantInventoryTxType.IMPORT) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RestaurantInventoryTxtypeEnumValueMap = {
  'IMPORT': 0,
  'EXPORT': 1,
  'AUTO_DEDUCT': 2,
};
const _RestaurantInventoryTxtypeValueEnumMap = {
  0: RestaurantInventoryTxType.IMPORT,
  1: RestaurantInventoryTxType.EXPORT,
  2: RestaurantInventoryTxType.AUTO_DEDUCT,
};

Id _restaurantInventoryTxGetId(RestaurantInventoryTx object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _restaurantInventoryTxGetLinks(
    RestaurantInventoryTx object) {
  return [];
}

void _restaurantInventoryTxAttach(
    IsarCollection<dynamic> col, Id id, RestaurantInventoryTx object) {
  object.id = id;
}

extension RestaurantInventoryTxQueryWhereSort
    on QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QWhere> {
  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension RestaurantInventoryTxQueryWhere on QueryBuilder<RestaurantInventoryTx,
    RestaurantInventoryTx, QWhereClause> {
  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
      createdAtLessThan(
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterWhereClause>
      createdAtBetween(
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

extension RestaurantInventoryTxQueryFilter on QueryBuilder<
    RestaurantInventoryTx, RestaurantInventoryTx, QFilterCondition> {
  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> ingredientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> ingredientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> ingredientNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> ingredientNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> typeEqualTo(RestaurantInventoryTxType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> typeGreaterThan(
    RestaurantInventoryTxType value, {
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> typeLessThan(
    RestaurantInventoryTxType value, {
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

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx,
      QAfterFilterCondition> typeBetween(
    RestaurantInventoryTxType lower,
    RestaurantInventoryTxType upper, {
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
}

extension RestaurantInventoryTxQueryObject on QueryBuilder<
    RestaurantInventoryTx, RestaurantInventoryTx, QFilterCondition> {}

extension RestaurantInventoryTxQueryLinks on QueryBuilder<RestaurantInventoryTx,
    RestaurantInventoryTx, QFilterCondition> {}

extension RestaurantInventoryTxQuerySortBy
    on QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QSortBy> {
  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByIngredientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByIngredientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientName', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByIngredientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientName', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension RestaurantInventoryTxQuerySortThenBy
    on QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QSortThenBy> {
  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByIngredientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByIngredientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByIngredientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientName', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByIngredientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ingredientName', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension RestaurantInventoryTxQueryWhereDistinct
    on QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct> {
  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct>
      distinctByIngredientId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct>
      distinctByIngredientName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ingredientName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct>
      distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTx, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension RestaurantInventoryTxQueryProperty on QueryBuilder<
    RestaurantInventoryTx, RestaurantInventoryTx, QQueryProperty> {
  QueryBuilder<RestaurantInventoryTx, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantInventoryTx, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RestaurantInventoryTx, String, QQueryOperations>
      ingredientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientId');
    });
  }

  QueryBuilder<RestaurantInventoryTx, String, QQueryOperations>
      ingredientNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredientName');
    });
  }

  QueryBuilder<RestaurantInventoryTx, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<RestaurantInventoryTx, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<RestaurantInventoryTx, RestaurantInventoryTxType,
      QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
