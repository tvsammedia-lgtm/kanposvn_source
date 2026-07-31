// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vlxd_order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdOrderCollection on Isar {
  IsarCollection<VlxdOrder> get vlxdOrders => this.collection();
}

const VlxdOrderSchema = CollectionSchema(
  name: r'VlxdOrder',
  id: 3337884341486608406,
  properties: {
    r'discount': PropertySchema(
      id: 0,
      name: r'discount',
      type: IsarType.double,
    ),
    r'expectedDeliveryDate': PropertySchema(
      id: 1,
      name: r'expectedDeliveryDate',
      type: IsarType.dateTime,
    ),
    r'isWholesaleContract': PropertySchema(
      id: 2,
      name: r'isWholesaleContract',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 3,
      name: r'notes',
      type: IsarType.string,
    ),
    r'orderCode': PropertySchema(
      id: 4,
      name: r'orderCode',
      type: IsarType.string,
    ),
    r'orderDate': PropertySchema(
      id: 5,
      name: r'orderDate',
      type: IsarType.dateTime,
    ),
    r'orderId': PropertySchema(
      id: 6,
      name: r'orderId',
      type: IsarType.string,
    ),
    r'paidAmount': PropertySchema(
      id: 7,
      name: r'paidAmount',
      type: IsarType.double,
    ),
    r'paymentMethod': PropertySchema(
      id: 8,
      name: r'paymentMethod',
      type: IsarType.byte,
      enumMap: _VlxdOrderpaymentMethodEnumValueMap,
    ),
    r'shippingFee': PropertySchema(
      id: 9,
      name: r'shippingFee',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VlxdOrderstatusEnumValueMap,
    ),
    r'subTotal': PropertySchema(
      id: 11,
      name: r'subTotal',
      type: IsarType.double,
    ),
    r'totalAmount': PropertySchema(
      id: 12,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'vatAmount': PropertySchema(
      id: 13,
      name: r'vatAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _vlxdOrderEstimateSize,
  serialize: _vlxdOrderSerialize,
  deserialize: _vlxdOrderDeserialize,
  deserializeProp: _vlxdOrderDeserializeProp,
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
    r'customer': LinkSchema(
      id: 725954372030324078,
      name: r'customer',
      target: r'VlxdCustomer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdOrderGetId,
  getLinks: _vlxdOrderGetLinks,
  attach: _vlxdOrderAttach,
  version: '3.1.0+1',
);

int _vlxdOrderEstimateSize(
  VlxdOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.orderCode.length * 3;
  bytesCount += 3 + object.orderId.length * 3;
  return bytesCount;
}

void _vlxdOrderSerialize(
  VlxdOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.discount);
  writer.writeDateTime(offsets[1], object.expectedDeliveryDate);
  writer.writeBool(offsets[2], object.isWholesaleContract);
  writer.writeString(offsets[3], object.notes);
  writer.writeString(offsets[4], object.orderCode);
  writer.writeDateTime(offsets[5], object.orderDate);
  writer.writeString(offsets[6], object.orderId);
  writer.writeDouble(offsets[7], object.paidAmount);
  writer.writeByte(offsets[8], object.paymentMethod.index);
  writer.writeDouble(offsets[9], object.shippingFee);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeDouble(offsets[11], object.subTotal);
  writer.writeDouble(offsets[12], object.totalAmount);
  writer.writeDouble(offsets[13], object.vatAmount);
}

VlxdOrder _vlxdOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdOrder();
  object.discount = reader.readDouble(offsets[0]);
  object.expectedDeliveryDate = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.isWholesaleContract = reader.readBool(offsets[2]);
  object.notes = reader.readString(offsets[3]);
  object.orderCode = reader.readString(offsets[4]);
  object.orderDate = reader.readDateTime(offsets[5]);
  object.orderId = reader.readString(offsets[6]);
  object.paidAmount = reader.readDouble(offsets[7]);
  object.paymentMethod =
      _VlxdOrderpaymentMethodValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          PaymentMethod.CASH;
  object.shippingFee = reader.readDouble(offsets[9]);
  object.status =
      _VlxdOrderstatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
          OrderStatus.PENDING;
  object.subTotal = reader.readDouble(offsets[11]);
  object.totalAmount = reader.readDouble(offsets[12]);
  object.vatAmount = reader.readDouble(offsets[13]);
  return object;
}

P _vlxdOrderDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (_VlxdOrderpaymentMethodValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PaymentMethod.CASH) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (_VlxdOrderstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          OrderStatus.PENDING) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VlxdOrderpaymentMethodEnumValueMap = {
  'CASH': 0,
  'TRANSFER': 1,
  'QR': 2,
  'DEBT': 3,
};
const _VlxdOrderpaymentMethodValueEnumMap = {
  0: PaymentMethod.CASH,
  1: PaymentMethod.TRANSFER,
  2: PaymentMethod.QR,
  3: PaymentMethod.DEBT,
};
const _VlxdOrderstatusEnumValueMap = {
  'PENDING': 0,
  'DELIVERING': 1,
  'COMPLETED': 2,
  'CANCELLED': 3,
};
const _VlxdOrderstatusValueEnumMap = {
  0: OrderStatus.PENDING,
  1: OrderStatus.DELIVERING,
  2: OrderStatus.COMPLETED,
  3: OrderStatus.CANCELLED,
};

Id _vlxdOrderGetId(VlxdOrder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdOrderGetLinks(VlxdOrder object) {
  return [object.customer];
}

void _vlxdOrderAttach(IsarCollection<dynamic> col, Id id, VlxdOrder object) {
  object.id = id;
  object.customer
      .attach(col, col.isar.collection<VlxdCustomer>(), r'customer', id);
}

extension VlxdOrderByIndex on IsarCollection<VlxdOrder> {
  Future<VlxdOrder?> getByOrderId(String orderId) {
    return getByIndex(r'orderId', [orderId]);
  }

  VlxdOrder? getByOrderIdSync(String orderId) {
    return getByIndexSync(r'orderId', [orderId]);
  }

  Future<bool> deleteByOrderId(String orderId) {
    return deleteByIndex(r'orderId', [orderId]);
  }

  bool deleteByOrderIdSync(String orderId) {
    return deleteByIndexSync(r'orderId', [orderId]);
  }

  Future<List<VlxdOrder?>> getAllByOrderId(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'orderId', values);
  }

  List<VlxdOrder?> getAllByOrderIdSync(List<String> orderIdValues) {
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

  Future<Id> putByOrderId(VlxdOrder object) {
    return putByIndex(r'orderId', object);
  }

  Id putByOrderIdSync(VlxdOrder object, {bool saveLinks = true}) {
    return putByIndexSync(r'orderId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderId(List<VlxdOrder> objects) {
    return putAllByIndex(r'orderId', objects);
  }

  List<Id> putAllByOrderIdSync(List<VlxdOrder> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'orderId', objects, saveLinks: saveLinks);
  }
}

extension VlxdOrderQueryWhereSort
    on QueryBuilder<VlxdOrder, VlxdOrder, QWhere> {
  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdOrderQueryWhere
    on QueryBuilder<VlxdOrder, VlxdOrder, QWhereClause> {
  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> idBetween(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> orderIdEqualTo(
      String orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterWhereClause> orderIdNotEqualTo(
      String orderId) {
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

extension VlxdOrderQueryFilter
    on QueryBuilder<VlxdOrder, VlxdOrder, QFilterCondition> {
  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> discountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> discountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> discountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> discountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      expectedDeliveryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedDeliveryDate',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      expectedDeliveryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedDeliveryDate',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      expectedDeliveryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedDeliveryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      expectedDeliveryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedDeliveryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      expectedDeliveryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedDeliveryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      expectedDeliveryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedDeliveryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      isWholesaleContractEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isWholesaleContract',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      orderCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      orderCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      orderDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdEqualTo(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdGreaterThan(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdLessThan(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdBetween(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdStartsWith(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdEndsWith(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> orderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      orderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> paidAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      paidAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> paidAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> paidAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      paymentMethodEqualTo(PaymentMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      paymentMethodGreaterThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      paymentMethodLessThan(
    PaymentMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      paymentMethodBetween(
    PaymentMethod lower,
    PaymentMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> shippingFeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shippingFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      shippingFeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shippingFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> shippingFeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shippingFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> shippingFeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shippingFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> statusEqualTo(
      OrderStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> statusGreaterThan(
    OrderStatus value, {
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> statusLessThan(
    OrderStatus value, {
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> statusBetween(
    OrderStatus lower,
    OrderStatus upper, {
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> subTotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> subTotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> subTotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subTotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> subTotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subTotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> totalAmountEqualTo(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> totalAmountLessThan(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> totalAmountBetween(
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

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> vatAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vatAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition>
      vatAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vatAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> vatAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vatAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> vatAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vatAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension VlxdOrderQueryObject
    on QueryBuilder<VlxdOrder, VlxdOrder, QFilterCondition> {}

extension VlxdOrderQueryLinks
    on QueryBuilder<VlxdOrder, VlxdOrder, QFilterCondition> {
  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> customer(
      FilterQuery<VlxdCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterFilterCondition> customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }
}

extension VlxdOrderQuerySortBy on QueryBuilder<VlxdOrder, VlxdOrder, QSortBy> {
  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy>
      sortByExpectedDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy>
      sortByExpectedDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByIsWholesaleContract() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWholesaleContract', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy>
      sortByIsWholesaleContractDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWholesaleContract', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByOrderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByOrderDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByShippingFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByShippingFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortBySubTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> sortByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }
}

extension VlxdOrderQuerySortThenBy
    on QueryBuilder<VlxdOrder, VlxdOrder, QSortThenBy> {
  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy>
      thenByExpectedDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy>
      thenByExpectedDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedDeliveryDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByIsWholesaleContract() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWholesaleContract', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy>
      thenByIsWholesaleContractDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isWholesaleContract', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByOrderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByOrderDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByPaidAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentMethod', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByShippingFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByShippingFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenBySubTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subTotal', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QAfterSortBy> thenByVatAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vatAmount', Sort.desc);
    });
  }
}

extension VlxdOrderQueryWhereDistinct
    on QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> {
  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct>
      distinctByExpectedDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedDeliveryDate');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct>
      distinctByIsWholesaleContract() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isWholesaleContract');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByOrderCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByOrderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderDate');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByOrderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByPaidAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidAmount');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentMethod');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByShippingFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shippingFee');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctBySubTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subTotal');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<VlxdOrder, VlxdOrder, QDistinct> distinctByVatAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vatAmount');
    });
  }
}

extension VlxdOrderQueryProperty
    on QueryBuilder<VlxdOrder, VlxdOrder, QQueryProperty> {
  QueryBuilder<VlxdOrder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdOrder, double, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<VlxdOrder, DateTime?, QQueryOperations>
      expectedDeliveryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedDeliveryDate');
    });
  }

  QueryBuilder<VlxdOrder, bool, QQueryOperations>
      isWholesaleContractProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isWholesaleContract');
    });
  }

  QueryBuilder<VlxdOrder, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<VlxdOrder, String, QQueryOperations> orderCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderCode');
    });
  }

  QueryBuilder<VlxdOrder, DateTime, QQueryOperations> orderDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderDate');
    });
  }

  QueryBuilder<VlxdOrder, String, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<VlxdOrder, double, QQueryOperations> paidAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidAmount');
    });
  }

  QueryBuilder<VlxdOrder, PaymentMethod, QQueryOperations>
      paymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentMethod');
    });
  }

  QueryBuilder<VlxdOrder, double, QQueryOperations> shippingFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shippingFee');
    });
  }

  QueryBuilder<VlxdOrder, OrderStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VlxdOrder, double, QQueryOperations> subTotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subTotal');
    });
  }

  QueryBuilder<VlxdOrder, double, QQueryOperations> totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<VlxdOrder, double, QQueryOperations> vatAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vatAmount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdOrderDetailCollection on Isar {
  IsarCollection<VlxdOrderDetail> get vlxdOrderDetails => this.collection();
}

const VlxdOrderDetailSchema = CollectionSchema(
  name: r'VlxdOrderDetail',
  id: 5877120424694505631,
  properties: {
    r'deliveredQuantity': PropertySchema(
      id: 0,
      name: r'deliveredQuantity',
      type: IsarType.double,
    ),
    r'discountAmount': PropertySchema(
      id: 1,
      name: r'discountAmount',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 2,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 4,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _vlxdOrderDetailEstimateSize,
  serialize: _vlxdOrderDetailSerialize,
  deserialize: _vlxdOrderDetailDeserialize,
  deserializeProp: _vlxdOrderDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'order': LinkSchema(
      id: 3683976404987321943,
      name: r'order',
      target: r'VlxdOrder',
      single: true,
    ),
    r'product': LinkSchema(
      id: 4618346777026538046,
      name: r'product',
      target: r'VlxdProduct',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdOrderDetailGetId,
  getLinks: _vlxdOrderDetailGetLinks,
  attach: _vlxdOrderDetailAttach,
  version: '3.1.0+1',
);

int _vlxdOrderDetailEstimateSize(
  VlxdOrderDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _vlxdOrderDetailSerialize(
  VlxdOrderDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.deliveredQuantity);
  writer.writeDouble(offsets[1], object.discountAmount);
  writer.writeDouble(offsets[2], object.quantity);
  writer.writeDouble(offsets[3], object.total);
  writer.writeDouble(offsets[4], object.unitPrice);
}

VlxdOrderDetail _vlxdOrderDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdOrderDetail();
  object.deliveredQuantity = reader.readDouble(offsets[0]);
  object.discountAmount = reader.readDouble(offsets[1]);
  object.id = id;
  object.quantity = reader.readDouble(offsets[2]);
  object.total = reader.readDouble(offsets[3]);
  object.unitPrice = reader.readDouble(offsets[4]);
  return object;
}

P _vlxdOrderDetailDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _vlxdOrderDetailGetId(VlxdOrderDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdOrderDetailGetLinks(VlxdOrderDetail object) {
  return [object.order, object.product];
}

void _vlxdOrderDetailAttach(
    IsarCollection<dynamic> col, Id id, VlxdOrderDetail object) {
  object.id = id;
  object.order.attach(col, col.isar.collection<VlxdOrder>(), r'order', id);
  object.product
      .attach(col, col.isar.collection<VlxdProduct>(), r'product', id);
}

extension VlxdOrderDetailQueryWhereSort
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QWhere> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdOrderDetailQueryWhere
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QWhereClause> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterWhereClause>
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterWhereClause> idBetween(
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
}

extension VlxdOrderDetailQueryFilter
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QFilterCondition> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      deliveredQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      deliveredQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveredQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      deliveredQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveredQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      deliveredQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveredQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      discountAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      discountAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      discountAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      discountAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      quantityEqualTo(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      quantityGreaterThan(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      quantityLessThan(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      quantityBetween(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      unitPriceEqualTo(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      unitPriceGreaterThan(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      unitPriceLessThan(
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

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      unitPriceBetween(
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

extension VlxdOrderDetailQueryObject
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QFilterCondition> {}

extension VlxdOrderDetailQueryLinks
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QFilterCondition> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition> order(
      FilterQuery<VlxdOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'order');
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'order', 0, true, 0, true);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition> product(
      FilterQuery<VlxdProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }
}

extension VlxdOrderDetailQuerySortBy
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QSortBy> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByDeliveredQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByDeliveredQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension VlxdOrderDetailQuerySortThenBy
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QSortThenBy> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByDeliveredQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredQuantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByDeliveredQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredQuantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension VlxdOrderDetailQueryWhereDistinct
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QDistinct> {
  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QDistinct>
      distinctByDeliveredQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredQuantity');
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QDistinct>
      distinctByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountAmount');
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension VlxdOrderDetailQueryProperty
    on QueryBuilder<VlxdOrderDetail, VlxdOrderDetail, QQueryProperty> {
  QueryBuilder<VlxdOrderDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdOrderDetail, double, QQueryOperations>
      deliveredQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredQuantity');
    });
  }

  QueryBuilder<VlxdOrderDetail, double, QQueryOperations>
      discountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountAmount');
    });
  }

  QueryBuilder<VlxdOrderDetail, double, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<VlxdOrderDetail, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<VlxdOrderDetail, double, QQueryOperations> unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVlxdDeliveryTicketCollection on Isar {
  IsarCollection<VlxdDeliveryTicket> get vlxdDeliveryTickets =>
      this.collection();
}

const VlxdDeliveryTicketSchema = CollectionSchema(
  name: r'VlxdDeliveryTicket',
  id: -1471772112649676614,
  properties: {
    r'deliveryDate': PropertySchema(
      id: 0,
      name: r'deliveryDate',
      type: IsarType.dateTime,
    ),
    r'deliveryPhotoUrl': PropertySchema(
      id: 1,
      name: r'deliveryPhotoUrl',
      type: IsarType.string,
    ),
    r'driverName': PropertySchema(
      id: 2,
      name: r'driverName',
      type: IsarType.string,
    ),
    r'eSignatureUrl': PropertySchema(
      id: 3,
      name: r'eSignatureUrl',
      type: IsarType.string,
    ),
    r'gpsLocation': PropertySchema(
      id: 4,
      name: r'gpsLocation',
      type: IsarType.string,
    ),
    r'receiverName': PropertySchema(
      id: 5,
      name: r'receiverName',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VlxdDeliveryTicketstatusEnumValueMap,
    ),
    r'ticketId': PropertySchema(
      id: 7,
      name: r'ticketId',
      type: IsarType.string,
    ),
    r'vehicleInfo': PropertySchema(
      id: 8,
      name: r'vehicleInfo',
      type: IsarType.string,
    )
  },
  estimateSize: _vlxdDeliveryTicketEstimateSize,
  serialize: _vlxdDeliveryTicketSerialize,
  deserialize: _vlxdDeliveryTicketDeserialize,
  deserializeProp: _vlxdDeliveryTicketDeserializeProp,
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
    )
  },
  links: {
    r'order': LinkSchema(
      id: 1026772921919629228,
      name: r'order',
      target: r'VlxdOrder',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vlxdDeliveryTicketGetId,
  getLinks: _vlxdDeliveryTicketGetLinks,
  attach: _vlxdDeliveryTicketAttach,
  version: '3.1.0+1',
);

int _vlxdDeliveryTicketEstimateSize(
  VlxdDeliveryTicket object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deliveryPhotoUrl.length * 3;
  bytesCount += 3 + object.driverName.length * 3;
  bytesCount += 3 + object.eSignatureUrl.length * 3;
  bytesCount += 3 + object.gpsLocation.length * 3;
  bytesCount += 3 + object.receiverName.length * 3;
  bytesCount += 3 + object.ticketId.length * 3;
  bytesCount += 3 + object.vehicleInfo.length * 3;
  return bytesCount;
}

void _vlxdDeliveryTicketSerialize(
  VlxdDeliveryTicket object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deliveryDate);
  writer.writeString(offsets[1], object.deliveryPhotoUrl);
  writer.writeString(offsets[2], object.driverName);
  writer.writeString(offsets[3], object.eSignatureUrl);
  writer.writeString(offsets[4], object.gpsLocation);
  writer.writeString(offsets[5], object.receiverName);
  writer.writeByte(offsets[6], object.status.index);
  writer.writeString(offsets[7], object.ticketId);
  writer.writeString(offsets[8], object.vehicleInfo);
}

VlxdDeliveryTicket _vlxdDeliveryTicketDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VlxdDeliveryTicket();
  object.deliveryDate = reader.readDateTime(offsets[0]);
  object.deliveryPhotoUrl = reader.readString(offsets[1]);
  object.driverName = reader.readString(offsets[2]);
  object.eSignatureUrl = reader.readString(offsets[3]);
  object.gpsLocation = reader.readString(offsets[4]);
  object.id = id;
  object.receiverName = reader.readString(offsets[5]);
  object.status = _VlxdDeliveryTicketstatusValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      OrderStatus.PENDING;
  object.ticketId = reader.readString(offsets[7]);
  object.vehicleInfo = reader.readString(offsets[8]);
  return object;
}

P _vlxdDeliveryTicketDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_VlxdDeliveryTicketstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          OrderStatus.PENDING) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VlxdDeliveryTicketstatusEnumValueMap = {
  'PENDING': 0,
  'DELIVERING': 1,
  'COMPLETED': 2,
  'CANCELLED': 3,
};
const _VlxdDeliveryTicketstatusValueEnumMap = {
  0: OrderStatus.PENDING,
  1: OrderStatus.DELIVERING,
  2: OrderStatus.COMPLETED,
  3: OrderStatus.CANCELLED,
};

Id _vlxdDeliveryTicketGetId(VlxdDeliveryTicket object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vlxdDeliveryTicketGetLinks(
    VlxdDeliveryTicket object) {
  return [object.order];
}

void _vlxdDeliveryTicketAttach(
    IsarCollection<dynamic> col, Id id, VlxdDeliveryTicket object) {
  object.id = id;
  object.order.attach(col, col.isar.collection<VlxdOrder>(), r'order', id);
}

extension VlxdDeliveryTicketByIndex on IsarCollection<VlxdDeliveryTicket> {
  Future<VlxdDeliveryTicket?> getByTicketId(String ticketId) {
    return getByIndex(r'ticketId', [ticketId]);
  }

  VlxdDeliveryTicket? getByTicketIdSync(String ticketId) {
    return getByIndexSync(r'ticketId', [ticketId]);
  }

  Future<bool> deleteByTicketId(String ticketId) {
    return deleteByIndex(r'ticketId', [ticketId]);
  }

  bool deleteByTicketIdSync(String ticketId) {
    return deleteByIndexSync(r'ticketId', [ticketId]);
  }

  Future<List<VlxdDeliveryTicket?>> getAllByTicketId(
      List<String> ticketIdValues) {
    final values = ticketIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'ticketId', values);
  }

  List<VlxdDeliveryTicket?> getAllByTicketIdSync(List<String> ticketIdValues) {
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

  Future<Id> putByTicketId(VlxdDeliveryTicket object) {
    return putByIndex(r'ticketId', object);
  }

  Id putByTicketIdSync(VlxdDeliveryTicket object, {bool saveLinks = true}) {
    return putByIndexSync(r'ticketId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTicketId(List<VlxdDeliveryTicket> objects) {
    return putAllByIndex(r'ticketId', objects);
  }

  List<Id> putAllByTicketIdSync(List<VlxdDeliveryTicket> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'ticketId', objects, saveLinks: saveLinks);
  }
}

extension VlxdDeliveryTicketQueryWhereSort
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QWhere> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VlxdDeliveryTicketQueryWhere
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QWhereClause> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
      ticketIdEqualTo(String ticketId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ticketId',
        value: [ticketId],
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterWhereClause>
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
}

extension VlxdDeliveryTicketQueryFilter
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QFilterCondition> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryPhotoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deliveryPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deliveryPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryPhotoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryPhotoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryPhotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      deliveryPhotoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryPhotoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      driverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eSignatureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eSignatureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eSignatureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eSignatureUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eSignatureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eSignatureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eSignatureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eSignatureUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eSignatureUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      eSignatureUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eSignatureUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gpsLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gpsLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gpsLocation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gpsLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gpsLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gpsLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gpsLocation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gpsLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      gpsLocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gpsLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      receiverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      statusEqualTo(OrderStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      statusGreaterThan(
    OrderStatus value, {
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      statusLessThan(
    OrderStatus value, {
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      statusBetween(
    OrderStatus lower,
    OrderStatus upper, {
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
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

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      ticketIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ticketId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      ticketIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ticketId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      ticketIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      ticketIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ticketId',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      vehicleInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleInfo',
        value: '',
      ));
    });
  }
}

extension VlxdDeliveryTicketQueryObject
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QFilterCondition> {}

extension VlxdDeliveryTicketQueryLinks
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QFilterCondition> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      order(FilterQuery<VlxdOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'order');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'order', 0, true, 0, true);
    });
  }
}

extension VlxdDeliveryTicketQuerySortBy
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QSortBy> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByDeliveryPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPhotoUrl', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByDeliveryPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPhotoUrl', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByESignatureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eSignatureUrl', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByESignatureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eSignatureUrl', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByGpsLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsLocation', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByGpsLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsLocation', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByReceiverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByReceiverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByVehicleInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleInfo', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      sortByVehicleInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleInfo', Sort.desc);
    });
  }
}

extension VlxdDeliveryTicketQuerySortThenBy
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QSortThenBy> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByDeliveryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryDate', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByDeliveryPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPhotoUrl', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByDeliveryPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryPhotoUrl', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByDriverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByDriverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverName', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByESignatureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eSignatureUrl', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByESignatureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eSignatureUrl', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByGpsLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsLocation', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByGpsLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gpsLocation', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByReceiverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByReceiverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByTicketId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByTicketIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ticketId', Sort.desc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByVehicleInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleInfo', Sort.asc);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QAfterSortBy>
      thenByVehicleInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleInfo', Sort.desc);
    });
  }
}

extension VlxdDeliveryTicketQueryWhereDistinct
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct> {
  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByDeliveryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryDate');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByDeliveryPhotoUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryPhotoUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByDriverName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByESignatureUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eSignatureUrl',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByGpsLocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gpsLocation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByReceiverName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByTicketId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ticketId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QDistinct>
      distinctByVehicleInfo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleInfo', caseSensitive: caseSensitive);
    });
  }
}

extension VlxdDeliveryTicketQueryProperty
    on QueryBuilder<VlxdDeliveryTicket, VlxdDeliveryTicket, QQueryProperty> {
  QueryBuilder<VlxdDeliveryTicket, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, DateTime, QQueryOperations>
      deliveryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryDate');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      deliveryPhotoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryPhotoUrl');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      driverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverName');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      eSignatureUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eSignatureUrl');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      gpsLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gpsLocation');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      receiverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverName');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, OrderStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      ticketIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ticketId');
    });
  }

  QueryBuilder<VlxdDeliveryTicket, String, QQueryOperations>
      vehicleInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleInfo');
    });
  }
}
