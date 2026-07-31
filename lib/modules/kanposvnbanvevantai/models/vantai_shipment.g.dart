// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantai_shipment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVantaiShipmentCollection on Isar {
  IsarCollection<VantaiShipment> get vantaiShipments => this.collection();
}

const VantaiShipmentSchema = CollectionSchema(
  name: r'VantaiShipment',
  id: -7404738907433938254,
  properties: {
    r'codAmount': PropertySchema(
      id: 0,
      name: r'codAmount',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'receiverName': PropertySchema(
      id: 2,
      name: r'receiverName',
      type: IsarType.string,
    ),
    r'receiverPhone': PropertySchema(
      id: 3,
      name: r'receiverPhone',
      type: IsarType.string,
    ),
    r'senderName': PropertySchema(
      id: 4,
      name: r'senderName',
      type: IsarType.string,
    ),
    r'senderPhone': PropertySchema(
      id: 5,
      name: r'senderPhone',
      type: IsarType.string,
    ),
    r'shipmentCode': PropertySchema(
      id: 6,
      name: r'shipmentCode',
      type: IsarType.string,
    ),
    r'shipmentId': PropertySchema(
      id: 7,
      name: r'shipmentId',
      type: IsarType.string,
    ),
    r'shippingFee': PropertySchema(
      id: 8,
      name: r'shippingFee',
      type: IsarType.double,
    ),
    r'status': PropertySchema(
      id: 9,
      name: r'status',
      type: IsarType.byte,
      enumMap: _VantaiShipmentstatusEnumValueMap,
    ),
    r'weightKg': PropertySchema(
      id: 10,
      name: r'weightKg',
      type: IsarType.double,
    )
  },
  estimateSize: _vantaiShipmentEstimateSize,
  serialize: _vantaiShipmentSerialize,
  deserialize: _vantaiShipmentDeserialize,
  deserializeProp: _vantaiShipmentDeserializeProp,
  idName: r'id',
  indexes: {
    r'shipmentId': IndexSchema(
      id: 6533073523782276089,
      name: r'shipmentId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'shipmentId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'route': LinkSchema(
      id: -2776045744044653734,
      name: r'route',
      target: r'VantaiRoute',
      single: true,
    ),
    r'senderCustomer': LinkSchema(
      id: 2837134308614584347,
      name: r'senderCustomer',
      target: r'VantaiCustomer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _vantaiShipmentGetId,
  getLinks: _vantaiShipmentGetLinks,
  attach: _vantaiShipmentAttach,
  version: '3.1.0+1',
);

int _vantaiShipmentEstimateSize(
  VantaiShipment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.receiverName.length * 3;
  bytesCount += 3 + object.receiverPhone.length * 3;
  bytesCount += 3 + object.senderName.length * 3;
  bytesCount += 3 + object.senderPhone.length * 3;
  bytesCount += 3 + object.shipmentCode.length * 3;
  bytesCount += 3 + object.shipmentId.length * 3;
  return bytesCount;
}

void _vantaiShipmentSerialize(
  VantaiShipment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.codAmount);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.receiverName);
  writer.writeString(offsets[3], object.receiverPhone);
  writer.writeString(offsets[4], object.senderName);
  writer.writeString(offsets[5], object.senderPhone);
  writer.writeString(offsets[6], object.shipmentCode);
  writer.writeString(offsets[7], object.shipmentId);
  writer.writeDouble(offsets[8], object.shippingFee);
  writer.writeByte(offsets[9], object.status.index);
  writer.writeDouble(offsets[10], object.weightKg);
}

VantaiShipment _vantaiShipmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VantaiShipment();
  object.codAmount = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.receiverName = reader.readString(offsets[2]);
  object.receiverPhone = reader.readString(offsets[3]);
  object.senderName = reader.readString(offsets[4]);
  object.senderPhone = reader.readString(offsets[5]);
  object.shipmentCode = reader.readString(offsets[6]);
  object.shipmentId = reader.readString(offsets[7]);
  object.shippingFee = reader.readDouble(offsets[8]);
  object.status =
      _VantaiShipmentstatusValueEnumMap[reader.readByteOrNull(offsets[9])] ??
          ShipmentStatus.PENDING;
  object.weightKg = reader.readDouble(offsets[10]);
  return object;
}

P _vantaiShipmentDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (_VantaiShipmentstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ShipmentStatus.PENDING) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _VantaiShipmentstatusEnumValueMap = {
  'PENDING': 0,
  'IN_TRANSIT': 1,
  'DELIVERED': 2,
  'CANCELLED': 3,
};
const _VantaiShipmentstatusValueEnumMap = {
  0: ShipmentStatus.PENDING,
  1: ShipmentStatus.IN_TRANSIT,
  2: ShipmentStatus.DELIVERED,
  3: ShipmentStatus.CANCELLED,
};

Id _vantaiShipmentGetId(VantaiShipment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _vantaiShipmentGetLinks(VantaiShipment object) {
  return [object.route, object.senderCustomer];
}

void _vantaiShipmentAttach(
    IsarCollection<dynamic> col, Id id, VantaiShipment object) {
  object.id = id;
  object.route.attach(col, col.isar.collection<VantaiRoute>(), r'route', id);
  object.senderCustomer.attach(
      col, col.isar.collection<VantaiCustomer>(), r'senderCustomer', id);
}

extension VantaiShipmentByIndex on IsarCollection<VantaiShipment> {
  Future<VantaiShipment?> getByShipmentId(String shipmentId) {
    return getByIndex(r'shipmentId', [shipmentId]);
  }

  VantaiShipment? getByShipmentIdSync(String shipmentId) {
    return getByIndexSync(r'shipmentId', [shipmentId]);
  }

  Future<bool> deleteByShipmentId(String shipmentId) {
    return deleteByIndex(r'shipmentId', [shipmentId]);
  }

  bool deleteByShipmentIdSync(String shipmentId) {
    return deleteByIndexSync(r'shipmentId', [shipmentId]);
  }

  Future<List<VantaiShipment?>> getAllByShipmentId(
      List<String> shipmentIdValues) {
    final values = shipmentIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'shipmentId', values);
  }

  List<VantaiShipment?> getAllByShipmentIdSync(List<String> shipmentIdValues) {
    final values = shipmentIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'shipmentId', values);
  }

  Future<int> deleteAllByShipmentId(List<String> shipmentIdValues) {
    final values = shipmentIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'shipmentId', values);
  }

  int deleteAllByShipmentIdSync(List<String> shipmentIdValues) {
    final values = shipmentIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'shipmentId', values);
  }

  Future<Id> putByShipmentId(VantaiShipment object) {
    return putByIndex(r'shipmentId', object);
  }

  Id putByShipmentIdSync(VantaiShipment object, {bool saveLinks = true}) {
    return putByIndexSync(r'shipmentId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByShipmentId(List<VantaiShipment> objects) {
    return putAllByIndex(r'shipmentId', objects);
  }

  List<Id> putAllByShipmentIdSync(List<VantaiShipment> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'shipmentId', objects, saveLinks: saveLinks);
  }
}

extension VantaiShipmentQueryWhereSort
    on QueryBuilder<VantaiShipment, VantaiShipment, QWhere> {
  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VantaiShipmentQueryWhere
    on QueryBuilder<VantaiShipment, VantaiShipment, QWhereClause> {
  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause> idBetween(
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause>
      shipmentIdEqualTo(String shipmentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'shipmentId',
        value: [shipmentId],
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterWhereClause>
      shipmentIdNotEqualTo(String shipmentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shipmentId',
              lower: [],
              upper: [shipmentId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shipmentId',
              lower: [shipmentId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shipmentId',
              lower: [shipmentId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'shipmentId',
              lower: [],
              upper: [shipmentId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension VantaiShipmentQueryFilter
    on QueryBuilder<VantaiShipment, VantaiShipment, QFilterCondition> {
  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      codAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      codAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      codAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      codAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition> idBetween(
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      receiverPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderName',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shipmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shipmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shipmentCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shipmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shipmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipmentCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipmentCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipmentCode',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shipmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shipmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shippingFeeEqualTo(
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shippingFeeLessThan(
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      shippingFeeBetween(
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      statusEqualTo(ShipmentStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      statusGreaterThan(
    ShipmentStatus value, {
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      statusLessThan(
    ShipmentStatus value, {
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      statusBetween(
    ShipmentStatus lower,
    ShipmentStatus upper, {
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
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

extension VantaiShipmentQueryObject
    on QueryBuilder<VantaiShipment, VantaiShipment, QFilterCondition> {}

extension VantaiShipmentQueryLinks
    on QueryBuilder<VantaiShipment, VantaiShipment, QFilterCondition> {
  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition> route(
      FilterQuery<VantaiRoute> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'route');
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      routeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'route', 0, true, 0, true);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderCustomer(FilterQuery<VantaiCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'senderCustomer');
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterFilterCondition>
      senderCustomerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'senderCustomer', 0, true, 0, true);
    });
  }
}

extension VantaiShipmentQuerySortBy
    on QueryBuilder<VantaiShipment, VantaiShipment, QSortBy> {
  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> sortByCodAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codAmount', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByCodAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codAmount', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByReceiverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByReceiverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByReceiverPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverPhone', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByReceiverPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverPhone', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortBySenderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderName', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortBySenderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderName', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortBySenderPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderPhone', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortBySenderPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderPhone', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByShipmentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentCode', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByShipmentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentCode', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByShippingFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByShippingFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> sortByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      sortByWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.desc);
    });
  }
}

extension VantaiShipmentQuerySortThenBy
    on QueryBuilder<VantaiShipment, VantaiShipment, QSortThenBy> {
  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> thenByCodAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codAmount', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByCodAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codAmount', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByReceiverName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByReceiverNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverName', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByReceiverPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverPhone', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByReceiverPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverPhone', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenBySenderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderName', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenBySenderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderName', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenBySenderPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderPhone', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenBySenderPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderPhone', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByShipmentCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentCode', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByShipmentCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentCode', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByShippingFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByShippingFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shippingFee', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy> thenByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.asc);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QAfterSortBy>
      thenByWeightKgDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weightKg', Sort.desc);
    });
  }
}

extension VantaiShipmentQueryWhereDistinct
    on QueryBuilder<VantaiShipment, VantaiShipment, QDistinct> {
  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct>
      distinctByCodAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codAmount');
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct>
      distinctByReceiverName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct>
      distinctByReceiverPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct> distinctBySenderName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct> distinctBySenderPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct>
      distinctByShipmentCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipmentCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct> distinctByShipmentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipmentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct>
      distinctByShippingFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shippingFee');
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<VantaiShipment, VantaiShipment, QDistinct> distinctByWeightKg() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weightKg');
    });
  }
}

extension VantaiShipmentQueryProperty
    on QueryBuilder<VantaiShipment, VantaiShipment, QQueryProperty> {
  QueryBuilder<VantaiShipment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VantaiShipment, double, QQueryOperations> codAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codAmount');
    });
  }

  QueryBuilder<VantaiShipment, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<VantaiShipment, String, QQueryOperations>
      receiverNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverName');
    });
  }

  QueryBuilder<VantaiShipment, String, QQueryOperations>
      receiverPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverPhone');
    });
  }

  QueryBuilder<VantaiShipment, String, QQueryOperations> senderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderName');
    });
  }

  QueryBuilder<VantaiShipment, String, QQueryOperations> senderPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderPhone');
    });
  }

  QueryBuilder<VantaiShipment, String, QQueryOperations>
      shipmentCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipmentCode');
    });
  }

  QueryBuilder<VantaiShipment, String, QQueryOperations> shipmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipmentId');
    });
  }

  QueryBuilder<VantaiShipment, double, QQueryOperations> shippingFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shippingFee');
    });
  }

  QueryBuilder<VantaiShipment, ShipmentStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<VantaiShipment, double, QQueryOperations> weightKgProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weightKg');
    });
  }
}
