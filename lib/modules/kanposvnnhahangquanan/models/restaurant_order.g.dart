// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRestaurantOrderCollection on Isar {
  IsarCollection<RestaurantOrder> get restaurantOrders => this.collection();
}

const RestaurantOrderSchema = CollectionSchema(
  name: r'RestaurantOrder',
  id: -7784038315825185026,
  properties: {
    r'closedAt': PropertySchema(
      id: 0,
      name: r'closedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'details': PropertySchema(
      id: 2,
      name: r'details',
      type: IsarType.objectList,
      target: r'RestaurantOrderDetail',
    ),
    r'orderId': PropertySchema(
      id: 3,
      name: r'orderId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.byte,
      enumMap: _RestaurantOrderstatusEnumValueMap,
    ),
    r'totalAmount': PropertySchema(
      id: 5,
      name: r'totalAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _restaurantOrderEstimateSize,
  serialize: _restaurantOrderSerialize,
  deserialize: _restaurantOrderDeserialize,
  deserializeProp: _restaurantOrderDeserializeProp,
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
  links: {
    r'table': LinkSchema(
      id: -8032868875735534361,
      name: r'table',
      target: r'RestaurantTable',
      single: true,
    )
  },
  embeddedSchemas: {r'RestaurantOrderDetail': RestaurantOrderDetailSchema},
  getId: _restaurantOrderGetId,
  getLinks: _restaurantOrderGetLinks,
  attach: _restaurantOrderAttach,
  version: '3.1.0+1',
);

int _restaurantOrderEstimateSize(
  RestaurantOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.details.length * 3;
  {
    final offsets = allOffsets[RestaurantOrderDetail]!;
    for (var i = 0; i < object.details.length; i++) {
      final value = object.details[i];
      bytesCount +=
          RestaurantOrderDetailSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.orderId.length * 3;
  return bytesCount;
}

void _restaurantOrderSerialize(
  RestaurantOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.closedAt);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeObjectList<RestaurantOrderDetail>(
    offsets[2],
    allOffsets,
    RestaurantOrderDetailSchema.serialize,
    object.details,
  );
  writer.writeString(offsets[3], object.orderId);
  writer.writeByte(offsets[4], object.status.index);
  writer.writeDouble(offsets[5], object.totalAmount);
}

RestaurantOrder _restaurantOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantOrder();
  object.closedAt = reader.readDateTimeOrNull(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.details = reader.readObjectList<RestaurantOrderDetail>(
        offsets[2],
        RestaurantOrderDetailSchema.deserialize,
        allOffsets,
        RestaurantOrderDetail(),
      ) ??
      [];
  object.id = id;
  object.orderId = reader.readString(offsets[3]);
  object.status =
      _RestaurantOrderstatusValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          RestaurantOrderStatus.SERVING;
  object.totalAmount = reader.readDouble(offsets[5]);
  return object;
}

P _restaurantOrderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<RestaurantOrderDetail>(
            offset,
            RestaurantOrderDetailSchema.deserialize,
            allOffsets,
            RestaurantOrderDetail(),
          ) ??
          []) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_RestaurantOrderstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RestaurantOrderStatus.SERVING) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RestaurantOrderstatusEnumValueMap = {
  'SERVING': 0,
  'COMPLETED': 1,
};
const _RestaurantOrderstatusValueEnumMap = {
  0: RestaurantOrderStatus.SERVING,
  1: RestaurantOrderStatus.COMPLETED,
};

Id _restaurantOrderGetId(RestaurantOrder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _restaurantOrderGetLinks(RestaurantOrder object) {
  return [object.table];
}

void _restaurantOrderAttach(
    IsarCollection<dynamic> col, Id id, RestaurantOrder object) {
  object.id = id;
  object.table
      .attach(col, col.isar.collection<RestaurantTable>(), r'table', id);
}

extension RestaurantOrderByIndex on IsarCollection<RestaurantOrder> {
  Future<RestaurantOrder?> getByOrderId(String orderId) {
    return getByIndex(r'orderId', [orderId]);
  }

  RestaurantOrder? getByOrderIdSync(String orderId) {
    return getByIndexSync(r'orderId', [orderId]);
  }

  Future<bool> deleteByOrderId(String orderId) {
    return deleteByIndex(r'orderId', [orderId]);
  }

  bool deleteByOrderIdSync(String orderId) {
    return deleteByIndexSync(r'orderId', [orderId]);
  }

  Future<List<RestaurantOrder?>> getAllByOrderId(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'orderId', values);
  }

  List<RestaurantOrder?> getAllByOrderIdSync(List<String> orderIdValues) {
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

  Future<Id> putByOrderId(RestaurantOrder object) {
    return putByIndex(r'orderId', object);
  }

  Id putByOrderIdSync(RestaurantOrder object, {bool saveLinks = true}) {
    return putByIndexSync(r'orderId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderId(List<RestaurantOrder> objects) {
    return putAllByIndex(r'orderId', objects);
  }

  List<Id> putAllByOrderIdSync(List<RestaurantOrder> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'orderId', objects, saveLinks: saveLinks);
  }
}

extension RestaurantOrderQueryWhereSort
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QWhere> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RestaurantOrderQueryWhere
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QWhereClause> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause> idBetween(
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause>
      orderIdEqualTo(String orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterWhereClause>
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

extension RestaurantOrderQueryFilter
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QFilterCondition> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      closedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'closedAt',
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      closedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'closedAt',
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      closedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'closedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      closedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'closedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      closedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'closedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      closedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'closedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'details',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'details',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'details',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'details',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'details',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'details',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      orderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      orderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      orderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      orderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      statusEqualTo(RestaurantOrderStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      statusGreaterThan(
    RestaurantOrderStatus value, {
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      statusLessThan(
    RestaurantOrderStatus value, {
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      statusBetween(
    RestaurantOrderStatus lower,
    RestaurantOrderStatus upper, {
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

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      totalAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      totalAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      totalAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      totalAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RestaurantOrderQueryObject
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QFilterCondition> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      detailsElement(FilterQuery<RestaurantOrderDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'details');
    });
  }
}

extension RestaurantOrderQueryLinks
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QFilterCondition> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition> table(
      FilterQuery<RestaurantTable> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'table');
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterFilterCondition>
      tableIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'table', 0, true, 0, true);
    });
  }
}

extension RestaurantOrderQuerySortBy
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QSortBy> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy> sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension RestaurantOrderQuerySortThenBy
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QSortThenBy> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByClosedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'closedAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy> thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension RestaurantOrderQueryWhereDistinct
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QDistinct> {
  QueryBuilder<RestaurantOrder, RestaurantOrder, QDistinct>
      distinctByClosedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'closedAt');
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QDistinct> distinctByOrderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrder, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }
}

extension RestaurantOrderQueryProperty
    on QueryBuilder<RestaurantOrder, RestaurantOrder, QQueryProperty> {
  QueryBuilder<RestaurantOrder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RestaurantOrder, DateTime?, QQueryOperations>
      closedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'closedAt');
    });
  }

  QueryBuilder<RestaurantOrder, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RestaurantOrder, List<RestaurantOrderDetail>, QQueryOperations>
      detailsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'details');
    });
  }

  QueryBuilder<RestaurantOrder, String, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<RestaurantOrder, RestaurantOrderStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RestaurantOrder, double, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RestaurantOrderDetailSchema = Schema(
  name: r'RestaurantOrderDetail',
  id: 23126935962928250,
  properties: {
    r'detailId': PropertySchema(
      id: 0,
      name: r'detailId',
      type: IsarType.string,
    ),
    r'itemId': PropertySchema(
      id: 1,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 2,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 3,
      name: r'note',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 4,
      name: r'price',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 5,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _RestaurantOrderDetailstatusEnumValueMap,
    )
  },
  estimateSize: _restaurantOrderDetailEstimateSize,
  serialize: _restaurantOrderDetailSerialize,
  deserialize: _restaurantOrderDetailDeserialize,
  deserializeProp: _restaurantOrderDetailDeserializeProp,
);

int _restaurantOrderDetailEstimateSize(
  RestaurantOrderDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.detailId.length * 3;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _restaurantOrderDetailSerialize(
  RestaurantOrderDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.detailId);
  writer.writeString(offsets[1], object.itemId);
  writer.writeString(offsets[2], object.itemName);
  writer.writeString(offsets[3], object.note);
  writer.writeDouble(offsets[4], object.price);
  writer.writeLong(offsets[5], object.quantity);
  writer.writeByte(offsets[6], object.status.index);
}

RestaurantOrderDetail _restaurantOrderDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RestaurantOrderDetail();
  object.detailId = reader.readString(offsets[0]);
  object.itemId = reader.readString(offsets[1]);
  object.itemName = reader.readString(offsets[2]);
  object.note = reader.readString(offsets[3]);
  object.price = reader.readDouble(offsets[4]);
  object.quantity = reader.readLong(offsets[5]);
  object.status = _RestaurantOrderDetailstatusValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      RestaurantOrderItemStatus.PENDING;
  return object;
}

P _restaurantOrderDetailDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (_RestaurantOrderDetailstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RestaurantOrderItemStatus.PENDING) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RestaurantOrderDetailstatusEnumValueMap = {
  'PENDING': 0,
  'COOKING': 1,
  'DONE': 2,
};
const _RestaurantOrderDetailstatusValueEnumMap = {
  0: RestaurantOrderItemStatus.PENDING,
  1: RestaurantOrderItemStatus.COOKING,
  2: RestaurantOrderItemStatus.DONE,
};

extension RestaurantOrderDetailQueryFilter on QueryBuilder<
    RestaurantOrderDetail, RestaurantOrderDetail, QFilterCondition> {
  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'detailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'detailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'detailId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'detailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'detailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
          QAfterFilterCondition>
      detailIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'detailId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
          QAfterFilterCondition>
      detailIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'detailId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'detailId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> detailIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'detailId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdEqualTo(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdGreaterThan(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdLessThan(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdBetween(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdStartsWith(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdEndsWith(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
          QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
          QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameEqualTo(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameGreaterThan(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameLessThan(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameBetween(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameStartsWith(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameEndsWith(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
          QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
          QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> priceGreaterThan(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> priceBetween(
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> statusEqualTo(RestaurantOrderItemStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> statusGreaterThan(
    RestaurantOrderItemStatus value, {
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> statusLessThan(
    RestaurantOrderItemStatus value, {
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

  QueryBuilder<RestaurantOrderDetail, RestaurantOrderDetail,
      QAfterFilterCondition> statusBetween(
    RestaurantOrderItemStatus lower,
    RestaurantOrderItemStatus upper, {
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
}

extension RestaurantOrderDetailQueryObject on QueryBuilder<
    RestaurantOrderDetail, RestaurantOrderDetail, QFilterCondition> {}
