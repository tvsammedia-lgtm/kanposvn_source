// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eshop_gps_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEshopShipmentCollection on Isar {
  IsarCollection<EshopShipment> get eshopShipments => this.collection();
}

const EshopShipmentSchema = CollectionSchema(
  name: r'EshopShipment',
  id: 8128562139516245243,
  properties: {
    r'carrier': PropertySchema(
      id: 0,
      name: r'carrier',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deliveredAt': PropertySchema(
      id: 2,
      name: r'deliveredAt',
      type: IsarType.dateTime,
    ),
    r'destAddress': PropertySchema(
      id: 3,
      name: r'destAddress',
      type: IsarType.string,
    ),
    r'destLat': PropertySchema(
      id: 4,
      name: r'destLat',
      type: IsarType.double,
    ),
    r'destLng': PropertySchema(
      id: 5,
      name: r'destLng',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'orderId': PropertySchema(
      id: 7,
      name: r'orderId',
      type: IsarType.string,
    ),
    r'originLat': PropertySchema(
      id: 8,
      name: r'originLat',
      type: IsarType.double,
    ),
    r'originLng': PropertySchema(
      id: 9,
      name: r'originLng',
      type: IsarType.double,
    ),
    r'shipmentId': PropertySchema(
      id: 10,
      name: r'shipmentId',
      type: IsarType.string,
    ),
    r'shipperName': PropertySchema(
      id: 11,
      name: r'shipperName',
      type: IsarType.string,
    ),
    r'shipperPhone': PropertySchema(
      id: 12,
      name: r'shipperPhone',
      type: IsarType.string,
    ),
    r'startedAt': PropertySchema(
      id: 13,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 14,
      name: r'status',
      type: IsarType.string,
    ),
    r'totalDistanceKm': PropertySchema(
      id: 15,
      name: r'totalDistanceKm',
      type: IsarType.double,
    )
  },
  estimateSize: _eshopShipmentEstimateSize,
  serialize: _eshopShipmentSerialize,
  deserialize: _eshopShipmentDeserialize,
  deserializeProp: _eshopShipmentDeserializeProp,
  idName: r'isarId',
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
    ),
    r'orderId': IndexSchema(
      id: -6176610178429382285,
      name: r'orderId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'orderId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _eshopShipmentGetId,
  getLinks: _eshopShipmentGetLinks,
  attach: _eshopShipmentAttach,
  version: '3.1.0+1',
);

int _eshopShipmentEstimateSize(
  EshopShipment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.carrier.length * 3;
  bytesCount += 3 + object.destAddress.length * 3;
  bytesCount += 3 + object.orderId.length * 3;
  bytesCount += 3 + object.shipmentId.length * 3;
  bytesCount += 3 + object.shipperName.length * 3;
  bytesCount += 3 + object.shipperPhone.length * 3;
  bytesCount += 3 + object.status.length * 3;
  return bytesCount;
}

void _eshopShipmentSerialize(
  EshopShipment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.carrier);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.deliveredAt);
  writer.writeString(offsets[3], object.destAddress);
  writer.writeDouble(offsets[4], object.destLat);
  writer.writeDouble(offsets[5], object.destLng);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.orderId);
  writer.writeDouble(offsets[8], object.originLat);
  writer.writeDouble(offsets[9], object.originLng);
  writer.writeString(offsets[10], object.shipmentId);
  writer.writeString(offsets[11], object.shipperName);
  writer.writeString(offsets[12], object.shipperPhone);
  writer.writeDateTime(offsets[13], object.startedAt);
  writer.writeString(offsets[14], object.status);
  writer.writeDouble(offsets[15], object.totalDistanceKm);
}

EshopShipment _eshopShipmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EshopShipment();
  object.carrier = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.deliveredAt = reader.readDateTimeOrNull(offsets[2]);
  object.destAddress = reader.readString(offsets[3]);
  object.destLat = reader.readDouble(offsets[4]);
  object.destLng = reader.readDouble(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.isarId = id;
  object.orderId = reader.readString(offsets[7]);
  object.originLat = reader.readDouble(offsets[8]);
  object.originLng = reader.readDouble(offsets[9]);
  object.shipmentId = reader.readString(offsets[10]);
  object.shipperName = reader.readString(offsets[11]);
  object.shipperPhone = reader.readString(offsets[12]);
  object.startedAt = reader.readDateTime(offsets[13]);
  object.status = reader.readString(offsets[14]);
  object.totalDistanceKm = reader.readDouble(offsets[15]);
  return object;
}

P _eshopShipmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _eshopShipmentGetId(EshopShipment object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _eshopShipmentGetLinks(EshopShipment object) {
  return [];
}

void _eshopShipmentAttach(
    IsarCollection<dynamic> col, Id id, EshopShipment object) {
  object.isarId = id;
}

extension EshopShipmentByIndex on IsarCollection<EshopShipment> {
  Future<EshopShipment?> getByShipmentId(String shipmentId) {
    return getByIndex(r'shipmentId', [shipmentId]);
  }

  EshopShipment? getByShipmentIdSync(String shipmentId) {
    return getByIndexSync(r'shipmentId', [shipmentId]);
  }

  Future<bool> deleteByShipmentId(String shipmentId) {
    return deleteByIndex(r'shipmentId', [shipmentId]);
  }

  bool deleteByShipmentIdSync(String shipmentId) {
    return deleteByIndexSync(r'shipmentId', [shipmentId]);
  }

  Future<List<EshopShipment?>> getAllByShipmentId(
      List<String> shipmentIdValues) {
    final values = shipmentIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'shipmentId', values);
  }

  List<EshopShipment?> getAllByShipmentIdSync(List<String> shipmentIdValues) {
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

  Future<Id> putByShipmentId(EshopShipment object) {
    return putByIndex(r'shipmentId', object);
  }

  Id putByShipmentIdSync(EshopShipment object, {bool saveLinks = true}) {
    return putByIndexSync(r'shipmentId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByShipmentId(List<EshopShipment> objects) {
    return putAllByIndex(r'shipmentId', objects);
  }

  List<Id> putAllByShipmentIdSync(List<EshopShipment> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'shipmentId', objects, saveLinks: saveLinks);
  }
}

extension EshopShipmentQueryWhereSort
    on QueryBuilder<EshopShipment, EshopShipment, QWhere> {
  QueryBuilder<EshopShipment, EshopShipment, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EshopShipmentQueryWhere
    on QueryBuilder<EshopShipment, EshopShipment, QWhereClause> {
  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause>
      shipmentIdEqualTo(String shipmentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'shipmentId',
        value: [shipmentId],
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause> orderIdEqualTo(
      String orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterWhereClause>
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

extension EshopShipmentQueryFilter
    on QueryBuilder<EshopShipment, EshopShipment, QFilterCondition> {
  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carrier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carrier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrier',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      carrierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carrier',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      deliveredAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredAt',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      deliveredAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredAt',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      deliveredAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      deliveredAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      deliveredAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      deliveredAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveredAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      destLngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      orderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      orderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      orderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      orderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originLat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originLat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originLng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      originLngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originLng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
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

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipperName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shipperName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shipperName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shipperName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shipperName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shipperName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipperName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipperName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipperName',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipperName',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipperPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shipperPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shipperPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shipperPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shipperPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shipperPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipperPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipperPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipperPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      shipperPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipperPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      startedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      startedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      totalDistanceKmEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDistanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      totalDistanceKmGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDistanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      totalDistanceKmLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDistanceKm',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterFilterCondition>
      totalDistanceKmBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDistanceKm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension EshopShipmentQueryObject
    on QueryBuilder<EshopShipment, EshopShipment, QFilterCondition> {}

extension EshopShipmentQueryLinks
    on QueryBuilder<EshopShipment, EshopShipment, QFilterCondition> {}

extension EshopShipmentQuerySortBy
    on QueryBuilder<EshopShipment, EshopShipment, QSortBy> {
  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByCarrier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByCarrierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByDeliveredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredAt', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByDeliveredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredAt', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByDestAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByDestAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByDestLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByDestLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByDestLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByDestLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByOriginLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLat', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByOriginLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLat', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByOriginLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLng', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByOriginLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLng', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByShipperName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperName', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByShipperNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperName', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByShipperPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperPhone', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByShipperPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperPhone', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByTotalDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistanceKm', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      sortByTotalDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistanceKm', Sort.desc);
    });
  }
}

extension EshopShipmentQuerySortThenBy
    on QueryBuilder<EshopShipment, EshopShipment, QSortThenBy> {
  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByCarrier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByCarrierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByDeliveredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredAt', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByDeliveredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredAt', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByDestAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByDestAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destAddress', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByDestLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByDestLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLat', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByDestLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByDestLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destLng', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByOriginLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLat', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByOriginLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLat', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByOriginLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLng', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByOriginLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originLng', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByShipperName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperName', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByShipperNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperName', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByShipperPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperPhone', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByShipperPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipperPhone', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByTotalDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistanceKm', Sort.asc);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QAfterSortBy>
      thenByTotalDistanceKmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDistanceKm', Sort.desc);
    });
  }
}

extension EshopShipmentQueryWhereDistinct
    on QueryBuilder<EshopShipment, EshopShipment, QDistinct> {
  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByCarrier(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carrier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct>
      distinctByDeliveredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredAt');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByDestAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByDestLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destLat');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByDestLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destLng');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByOrderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByOriginLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originLat');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByOriginLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originLng');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByShipmentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipmentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByShipperName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipperName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByShipperPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipperPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopShipment, EshopShipment, QDistinct>
      distinctByTotalDistanceKm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDistanceKm');
    });
  }
}

extension EshopShipmentQueryProperty
    on QueryBuilder<EshopShipment, EshopShipment, QQueryProperty> {
  QueryBuilder<EshopShipment, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> carrierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carrier');
    });
  }

  QueryBuilder<EshopShipment, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<EshopShipment, DateTime?, QQueryOperations>
      deliveredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredAt');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> destAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destAddress');
    });
  }

  QueryBuilder<EshopShipment, double, QQueryOperations> destLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destLat');
    });
  }

  QueryBuilder<EshopShipment, double, QQueryOperations> destLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destLng');
    });
  }

  QueryBuilder<EshopShipment, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<EshopShipment, double, QQueryOperations> originLatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originLat');
    });
  }

  QueryBuilder<EshopShipment, double, QQueryOperations> originLngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originLng');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> shipmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipmentId');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> shipperNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipperName');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> shipperPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipperPhone');
    });
  }

  QueryBuilder<EshopShipment, DateTime, QQueryOperations> startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<EshopShipment, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<EshopShipment, double, QQueryOperations>
      totalDistanceKmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDistanceKm');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEshopGpsPingCollection on Isar {
  IsarCollection<EshopGpsPing> get eshopGpsPings => this.collection();
}

const EshopGpsPingSchema = CollectionSchema(
  name: r'EshopGpsPing',
  id: 1764105459584489738,
  properties: {
    r'accuracyMeters': PropertySchema(
      id: 0,
      name: r'accuracyMeters',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 1,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lat': PropertySchema(
      id: 2,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lng': PropertySchema(
      id: 3,
      name: r'lng',
      type: IsarType.double,
    ),
    r'pingId': PropertySchema(
      id: 4,
      name: r'pingId',
      type: IsarType.string,
    ),
    r'recordedAt': PropertySchema(
      id: 5,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'shipmentId': PropertySchema(
      id: 6,
      name: r'shipmentId',
      type: IsarType.string,
    ),
    r'speedKmh': PropertySchema(
      id: 7,
      name: r'speedKmh',
      type: IsarType.double,
    )
  },
  estimateSize: _eshopGpsPingEstimateSize,
  serialize: _eshopGpsPingSerialize,
  deserialize: _eshopGpsPingDeserialize,
  deserializeProp: _eshopGpsPingDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'pingId': IndexSchema(
      id: -4627505682702215256,
      name: r'pingId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'pingId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'shipmentId': IndexSchema(
      id: 6533073523782276089,
      name: r'shipmentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'shipmentId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'recordedAt': IndexSchema(
      id: -5046025352082009396,
      name: r'recordedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'recordedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _eshopGpsPingGetId,
  getLinks: _eshopGpsPingGetLinks,
  attach: _eshopGpsPingAttach,
  version: '3.1.0+1',
);

int _eshopGpsPingEstimateSize(
  EshopGpsPing object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pingId.length * 3;
  bytesCount += 3 + object.shipmentId.length * 3;
  return bytesCount;
}

void _eshopGpsPingSerialize(
  EshopGpsPing object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracyMeters);
  writer.writeBool(offsets[1], object.isSynced);
  writer.writeDouble(offsets[2], object.lat);
  writer.writeDouble(offsets[3], object.lng);
  writer.writeString(offsets[4], object.pingId);
  writer.writeDateTime(offsets[5], object.recordedAt);
  writer.writeString(offsets[6], object.shipmentId);
  writer.writeDouble(offsets[7], object.speedKmh);
}

EshopGpsPing _eshopGpsPingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EshopGpsPing();
  object.accuracyMeters = reader.readDouble(offsets[0]);
  object.isSynced = reader.readBool(offsets[1]);
  object.isarId = id;
  object.lat = reader.readDouble(offsets[2]);
  object.lng = reader.readDouble(offsets[3]);
  object.pingId = reader.readString(offsets[4]);
  object.recordedAt = reader.readDateTime(offsets[5]);
  object.shipmentId = reader.readString(offsets[6]);
  object.speedKmh = reader.readDouble(offsets[7]);
  return object;
}

P _eshopGpsPingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _eshopGpsPingGetId(EshopGpsPing object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _eshopGpsPingGetLinks(EshopGpsPing object) {
  return [];
}

void _eshopGpsPingAttach(
    IsarCollection<dynamic> col, Id id, EshopGpsPing object) {
  object.isarId = id;
}

extension EshopGpsPingByIndex on IsarCollection<EshopGpsPing> {
  Future<EshopGpsPing?> getByPingId(String pingId) {
    return getByIndex(r'pingId', [pingId]);
  }

  EshopGpsPing? getByPingIdSync(String pingId) {
    return getByIndexSync(r'pingId', [pingId]);
  }

  Future<bool> deleteByPingId(String pingId) {
    return deleteByIndex(r'pingId', [pingId]);
  }

  bool deleteByPingIdSync(String pingId) {
    return deleteByIndexSync(r'pingId', [pingId]);
  }

  Future<List<EshopGpsPing?>> getAllByPingId(List<String> pingIdValues) {
    final values = pingIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'pingId', values);
  }

  List<EshopGpsPing?> getAllByPingIdSync(List<String> pingIdValues) {
    final values = pingIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'pingId', values);
  }

  Future<int> deleteAllByPingId(List<String> pingIdValues) {
    final values = pingIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'pingId', values);
  }

  int deleteAllByPingIdSync(List<String> pingIdValues) {
    final values = pingIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'pingId', values);
  }

  Future<Id> putByPingId(EshopGpsPing object) {
    return putByIndex(r'pingId', object);
  }

  Id putByPingIdSync(EshopGpsPing object, {bool saveLinks = true}) {
    return putByIndexSync(r'pingId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPingId(List<EshopGpsPing> objects) {
    return putAllByIndex(r'pingId', objects);
  }

  List<Id> putAllByPingIdSync(List<EshopGpsPing> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'pingId', objects, saveLinks: saveLinks);
  }
}

extension EshopGpsPingQueryWhereSort
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QWhere> {
  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhere> anyRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recordedAt'),
      );
    });
  }
}

extension EshopGpsPingQueryWhere
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QWhereClause> {
  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> pingIdEqualTo(
      String pingId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'pingId',
        value: [pingId],
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> pingIdNotEqualTo(
      String pingId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pingId',
              lower: [],
              upper: [pingId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pingId',
              lower: [pingId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pingId',
              lower: [pingId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'pingId',
              lower: [],
              upper: [pingId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> shipmentIdEqualTo(
      String shipmentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'shipmentId',
        value: [shipmentId],
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> recordedAtEqualTo(
      DateTime recordedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recordedAt',
        value: [recordedAt],
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause>
      recordedAtNotEqualTo(DateTime recordedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordedAt',
              lower: [],
              upper: [recordedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordedAt',
              lower: [recordedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordedAt',
              lower: [recordedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recordedAt',
              lower: [],
              upper: [recordedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause>
      recordedAtGreaterThan(
    DateTime recordedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recordedAt',
        lower: [recordedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause>
      recordedAtLessThan(
    DateTime recordedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recordedAt',
        lower: [],
        upper: [recordedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterWhereClause> recordedAtBetween(
    DateTime lowerRecordedAt,
    DateTime upperRecordedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recordedAt',
        lower: [lowerRecordedAt],
        includeLower: includeLower,
        upper: [upperRecordedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EshopGpsPingQueryFilter
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QFilterCondition> {
  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      accuracyMetersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accuracyMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      accuracyMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accuracyMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      accuracyMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accuracyMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      accuracyMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accuracyMeters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> latEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      latGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> latLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> latBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> lngEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      lngGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> lngLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lng',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> lngBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lng',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> pingIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> pingIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition> pingIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pingId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      pingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pingId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      recordedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      recordedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      recordedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
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

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      shipmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      shipmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      shipmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      shipmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      speedKmhEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      speedKmhGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      speedKmhLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speedKmh',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterFilterCondition>
      speedKmhBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speedKmh',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension EshopGpsPingQueryObject
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QFilterCondition> {}

extension EshopGpsPingQueryLinks
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QFilterCondition> {}

extension EshopGpsPingQuerySortBy
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QSortBy> {
  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      sortByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      sortByAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByPingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingId', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByPingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingId', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      sortByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortBySpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> sortBySpeedKmhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.desc);
    });
  }
}

extension EshopGpsPingQuerySortThenBy
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QSortThenBy> {
  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      thenByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      thenByAccuracyMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracyMeters', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByLatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lat', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByLngDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lng', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByPingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingId', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByPingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pingId', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy>
      thenByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenBySpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.asc);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QAfterSortBy> thenBySpeedKmhDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speedKmh', Sort.desc);
    });
  }
}

extension EshopGpsPingQueryWhereDistinct
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> {
  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct>
      distinctByAccuracyMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracyMeters');
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctByLat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lat');
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctByLng() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lng');
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctByPingId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctByShipmentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipmentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EshopGpsPing, EshopGpsPing, QDistinct> distinctBySpeedKmh() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speedKmh');
    });
  }
}

extension EshopGpsPingQueryProperty
    on QueryBuilder<EshopGpsPing, EshopGpsPing, QQueryProperty> {
  QueryBuilder<EshopGpsPing, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<EshopGpsPing, double, QQueryOperations>
      accuracyMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracyMeters');
    });
  }

  QueryBuilder<EshopGpsPing, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<EshopGpsPing, double, QQueryOperations> latProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lat');
    });
  }

  QueryBuilder<EshopGpsPing, double, QQueryOperations> lngProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lng');
    });
  }

  QueryBuilder<EshopGpsPing, String, QQueryOperations> pingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pingId');
    });
  }

  QueryBuilder<EshopGpsPing, DateTime, QQueryOperations> recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<EshopGpsPing, String, QQueryOperations> shipmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipmentId');
    });
  }

  QueryBuilder<EshopGpsPing, double, QQueryOperations> speedKmhProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speedKmh');
    });
  }
}
