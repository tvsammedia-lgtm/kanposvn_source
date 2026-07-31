// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhathuoc_order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocOrderCollection on Isar {
  IsarCollection<NhathuocOrder> get nhathuocOrders => this.collection();
}

const NhathuocOrderSchema = CollectionSchema(
  name: r'NhathuocOrder',
  id: -4171428376196864819,
  properties: {
    r'notes': PropertySchema(
      id: 0,
      name: r'notes',
      type: IsarType.string,
    ),
    r'orderCode': PropertySchema(
      id: 1,
      name: r'orderCode',
      type: IsarType.string,
    ),
    r'orderDate': PropertySchema(
      id: 2,
      name: r'orderDate',
      type: IsarType.dateTime,
    ),
    r'orderId': PropertySchema(
      id: 3,
      name: r'orderId',
      type: IsarType.string,
    ),
    r'prescriptionImage': PropertySchema(
      id: 4,
      name: r'prescriptionImage',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _NhathuocOrderstatusEnumValueMap,
    ),
    r'totalAmount': PropertySchema(
      id: 6,
      name: r'totalAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _nhathuocOrderEstimateSize,
  serialize: _nhathuocOrderSerialize,
  deserialize: _nhathuocOrderDeserialize,
  deserializeProp: _nhathuocOrderDeserializeProp,
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
    r'patient': LinkSchema(
      id: 3219839970834791161,
      name: r'patient',
      target: r'NhathuocPatient',
      single: true,
    ),
    r'details': LinkSchema(
      id: 4106254033578994195,
      name: r'details',
      target: r'NhathuocOrderDetail',
      single: false,
      linkName: r'order',
    )
  },
  embeddedSchemas: {},
  getId: _nhathuocOrderGetId,
  getLinks: _nhathuocOrderGetLinks,
  attach: _nhathuocOrderAttach,
  version: '3.1.0+1',
);

int _nhathuocOrderEstimateSize(
  NhathuocOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.orderCode.length * 3;
  bytesCount += 3 + object.orderId.length * 3;
  bytesCount += 3 + object.prescriptionImage.length * 3;
  return bytesCount;
}

void _nhathuocOrderSerialize(
  NhathuocOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.notes);
  writer.writeString(offsets[1], object.orderCode);
  writer.writeDateTime(offsets[2], object.orderDate);
  writer.writeString(offsets[3], object.orderId);
  writer.writeString(offsets[4], object.prescriptionImage);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeDouble(offsets[6], object.totalAmount);
}

NhathuocOrder _nhathuocOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocOrder();
  object.id = id;
  object.notes = reader.readString(offsets[0]);
  object.orderCode = reader.readString(offsets[1]);
  object.orderDate = reader.readDateTimeOrNull(offsets[2]);
  object.orderId = reader.readString(offsets[3]);
  object.prescriptionImage = reader.readString(offsets[4]);
  object.status =
      _NhathuocOrderstatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          NhathuocOrderStatus.PENDING;
  object.totalAmount = reader.readDouble(offsets[6]);
  return object;
}

P _nhathuocOrderDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_NhathuocOrderstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          NhathuocOrderStatus.PENDING) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NhathuocOrderstatusEnumValueMap = {
  'PENDING': 0,
  'COMPLETED': 1,
  'CANCELLED': 2,
};
const _NhathuocOrderstatusValueEnumMap = {
  0: NhathuocOrderStatus.PENDING,
  1: NhathuocOrderStatus.COMPLETED,
  2: NhathuocOrderStatus.CANCELLED,
};

Id _nhathuocOrderGetId(NhathuocOrder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocOrderGetLinks(NhathuocOrder object) {
  return [object.patient, object.details];
}

void _nhathuocOrderAttach(
    IsarCollection<dynamic> col, Id id, NhathuocOrder object) {
  object.id = id;
  object.patient
      .attach(col, col.isar.collection<NhathuocPatient>(), r'patient', id);
  object.details
      .attach(col, col.isar.collection<NhathuocOrderDetail>(), r'details', id);
}

extension NhathuocOrderByIndex on IsarCollection<NhathuocOrder> {
  Future<NhathuocOrder?> getByOrderId(String orderId) {
    return getByIndex(r'orderId', [orderId]);
  }

  NhathuocOrder? getByOrderIdSync(String orderId) {
    return getByIndexSync(r'orderId', [orderId]);
  }

  Future<bool> deleteByOrderId(String orderId) {
    return deleteByIndex(r'orderId', [orderId]);
  }

  bool deleteByOrderIdSync(String orderId) {
    return deleteByIndexSync(r'orderId', [orderId]);
  }

  Future<List<NhathuocOrder?>> getAllByOrderId(List<String> orderIdValues) {
    final values = orderIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'orderId', values);
  }

  List<NhathuocOrder?> getAllByOrderIdSync(List<String> orderIdValues) {
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

  Future<Id> putByOrderId(NhathuocOrder object) {
    return putByIndex(r'orderId', object);
  }

  Id putByOrderIdSync(NhathuocOrder object, {bool saveLinks = true}) {
    return putByIndexSync(r'orderId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOrderId(List<NhathuocOrder> objects) {
    return putAllByIndex(r'orderId', objects);
  }

  List<Id> putAllByOrderIdSync(List<NhathuocOrder> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'orderId', objects, saveLinks: saveLinks);
  }
}

extension NhathuocOrderQueryWhereSort
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QWhere> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocOrderQueryWhere
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QWhereClause> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause> idBetween(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause> orderIdEqualTo(
      String orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterWhereClause>
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

extension NhathuocOrderQueryFilter
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QFilterCondition> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesEqualTo(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesGreaterThan(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesLessThan(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesBetween(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesStartsWith(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesEndsWith(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeEqualTo(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeLessThan(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeBetween(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeStartsWith(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeEndsWith(
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderDate',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderDate',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderDateGreaterThan(
    DateTime? value, {
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderDateLessThan(
    DateTime? value, {
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderDateBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      orderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prescriptionImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prescriptionImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prescriptionImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prescriptionImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prescriptionImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prescriptionImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prescriptionImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prescriptionImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prescriptionImage',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      prescriptionImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prescriptionImage',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      statusEqualTo(NhathuocOrderStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      statusGreaterThan(
    NhathuocOrderStatus value, {
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      statusLessThan(
    NhathuocOrderStatus value, {
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      statusBetween(
    NhathuocOrderStatus lower,
    NhathuocOrderStatus upper, {
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
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

extension NhathuocOrderQueryObject
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QFilterCondition> {}

extension NhathuocOrderQueryLinks
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QFilterCondition> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition> patient(
      FilterQuery<NhathuocPatient> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'patient');
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      patientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'patient', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition> details(
      FilterQuery<NhathuocOrderDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'details');
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      detailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, true, length, true);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, false, 999999, true);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      detailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, length, include);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      detailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, include, 999999, true);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterFilterCondition>
      detailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'details', lower, includeLower, upper, includeUpper);
    });
  }
}

extension NhathuocOrderQuerySortBy
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QSortBy> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      sortByOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByOrderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      sortByOrderDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      sortByPrescriptionImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescriptionImage', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      sortByPrescriptionImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescriptionImage', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension NhathuocOrderQuerySortThenBy
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QSortThenBy> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      thenByOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByOrderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      thenByOrderDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      thenByPrescriptionImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescriptionImage', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      thenByPrescriptionImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prescriptionImage', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension NhathuocOrderQueryWhereDistinct
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct> {
  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct> distinctByOrderCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct> distinctByOrderDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderDate');
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct> distinctByOrderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct>
      distinctByPrescriptionImage({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prescriptionImage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrder, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }
}

extension NhathuocOrderQueryProperty
    on QueryBuilder<NhathuocOrder, NhathuocOrder, QQueryProperty> {
  QueryBuilder<NhathuocOrder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocOrder, String, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<NhathuocOrder, String, QQueryOperations> orderCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderCode');
    });
  }

  QueryBuilder<NhathuocOrder, DateTime?, QQueryOperations> orderDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderDate');
    });
  }

  QueryBuilder<NhathuocOrder, String, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<NhathuocOrder, String, QQueryOperations>
      prescriptionImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prescriptionImage');
    });
  }

  QueryBuilder<NhathuocOrder, NhathuocOrderStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<NhathuocOrder, double, QQueryOperations> totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocOrderDetailCollection on Isar {
  IsarCollection<NhathuocOrderDetail> get nhathuocOrderDetails =>
      this.collection();
}

const NhathuocOrderDetailSchema = CollectionSchema(
  name: r'NhathuocOrderDetail',
  id: 6709964161299964761,
  properties: {
    r'dosageInstructions': PropertySchema(
      id: 0,
      name: r'dosageInstructions',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 1,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 2,
      name: r'total',
      type: IsarType.double,
    ),
    r'unitPrice': PropertySchema(
      id: 3,
      name: r'unitPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _nhathuocOrderDetailEstimateSize,
  serialize: _nhathuocOrderDetailSerialize,
  deserialize: _nhathuocOrderDetailDeserialize,
  deserializeProp: _nhathuocOrderDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'order': LinkSchema(
      id: -4095758261255930289,
      name: r'order',
      target: r'NhathuocOrder',
      single: true,
    ),
    r'medicine': LinkSchema(
      id: -7383641049258570156,
      name: r'medicine',
      target: r'NhathuocMedicine',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _nhathuocOrderDetailGetId,
  getLinks: _nhathuocOrderDetailGetLinks,
  attach: _nhathuocOrderDetailAttach,
  version: '3.1.0+1',
);

int _nhathuocOrderDetailEstimateSize(
  NhathuocOrderDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dosageInstructions.length * 3;
  return bytesCount;
}

void _nhathuocOrderDetailSerialize(
  NhathuocOrderDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dosageInstructions);
  writer.writeDouble(offsets[1], object.quantity);
  writer.writeDouble(offsets[2], object.total);
  writer.writeDouble(offsets[3], object.unitPrice);
}

NhathuocOrderDetail _nhathuocOrderDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocOrderDetail();
  object.dosageInstructions = reader.readString(offsets[0]);
  object.id = id;
  object.quantity = reader.readDouble(offsets[1]);
  object.total = reader.readDouble(offsets[2]);
  object.unitPrice = reader.readDouble(offsets[3]);
  return object;
}

P _nhathuocOrderDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocOrderDetailGetId(NhathuocOrderDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocOrderDetailGetLinks(
    NhathuocOrderDetail object) {
  return [object.order, object.medicine];
}

void _nhathuocOrderDetailAttach(
    IsarCollection<dynamic> col, Id id, NhathuocOrderDetail object) {
  object.id = id;
  object.order.attach(col, col.isar.collection<NhathuocOrder>(), r'order', id);
  object.medicine
      .attach(col, col.isar.collection<NhathuocMedicine>(), r'medicine', id);
}

extension NhathuocOrderDetailQueryWhereSort
    on QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QWhere> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocOrderDetailQueryWhere
    on QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QWhereClause> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterWhereClause>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterWhereClause>
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
}

extension NhathuocOrderDetailQueryFilter on QueryBuilder<NhathuocOrderDetail,
    NhathuocOrderDetail, QFilterCondition> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosageInstructions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosageInstructions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      dosageInstructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosageInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
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

extension NhathuocOrderDetailQueryObject on QueryBuilder<NhathuocOrderDetail,
    NhathuocOrderDetail, QFilterCondition> {}

extension NhathuocOrderDetailQueryLinks on QueryBuilder<NhathuocOrderDetail,
    NhathuocOrderDetail, QFilterCondition> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      order(FilterQuery<NhathuocOrder> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'order');
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      orderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'order', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      medicine(FilterQuery<NhathuocMedicine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'medicine');
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterFilterCondition>
      medicineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicine', 0, true, 0, true);
    });
  }
}

extension NhathuocOrderDetailQuerySortBy
    on QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QSortBy> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByDosageInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByDosageInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      sortByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension NhathuocOrderDetailQuerySortThenBy
    on QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QSortThenBy> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByDosageInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByDosageInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QAfterSortBy>
      thenByUnitPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitPrice', Sort.desc);
    });
  }
}

extension NhathuocOrderDetailQueryWhereDistinct
    on QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QDistinct> {
  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QDistinct>
      distinctByDosageInstructions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosageInstructions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QDistinct>
      distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QDistinct>
      distinctByUnitPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitPrice');
    });
  }
}

extension NhathuocOrderDetailQueryProperty
    on QueryBuilder<NhathuocOrderDetail, NhathuocOrderDetail, QQueryProperty> {
  QueryBuilder<NhathuocOrderDetail, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocOrderDetail, String, QQueryOperations>
      dosageInstructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosageInstructions');
    });
  }

  QueryBuilder<NhathuocOrderDetail, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<NhathuocOrderDetail, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<NhathuocOrderDetail, double, QQueryOperations>
      unitPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitPrice');
    });
  }
}
