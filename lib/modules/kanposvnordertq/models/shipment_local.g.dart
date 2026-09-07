// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShipmentLocalCollection on Isar {
  IsarCollection<ShipmentLocal> get shipmentLocals => this.collection();
}

const ShipmentLocalSchema = CollectionSchema(
  name: r'ShipmentLocal',
  id: -3406136873255168011,
  properties: {
    r'actualArrival': PropertySchema(
      id: 0,
      name: r'actualArrival',
      type: IsarType.dateTime,
    ),
    r'actualDeparture': PropertySchema(
      id: 1,
      name: r'actualDeparture',
      type: IsarType.dateTime,
    ),
    r'carrier': PropertySchema(
      id: 2,
      name: r'carrier',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'destination': PropertySchema(
      id: 4,
      name: r'destination',
      type: IsarType.string,
    ),
    r'estimatedArrival': PropertySchema(
      id: 5,
      name: r'estimatedArrival',
      type: IsarType.dateTime,
    ),
    r'estimatedDeparture': PropertySchema(
      id: 6,
      name: r'estimatedDeparture',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 7,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'orderId': PropertySchema(
      id: 8,
      name: r'orderId',
      type: IsarType.string,
    ),
    r'origin': PropertySchema(
      id: 9,
      name: r'origin',
      type: IsarType.string,
    ),
    r'shipmentId': PropertySchema(
      id: 10,
      name: r'shipmentId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
    ),
    r'syncedAt': PropertySchema(
      id: 12,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'trackingNumber': PropertySchema(
      id: 13,
      name: r'trackingNumber',
      type: IsarType.string,
    ),
    r'tripId': PropertySchema(
      id: 14,
      name: r'tripId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 15,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _shipmentLocalEstimateSize,
  serialize: _shipmentLocalSerialize,
  deserialize: _shipmentLocalDeserialize,
  deserializeProp: _shipmentLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'shipmentId': IndexSchema(
      id: 6533073523782276089,
      name: r'shipmentId',
      unique: true,
      replace: false,
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
    ),
    r'trackingNumber': IndexSchema(
      id: 9080802972333263261,
      name: r'trackingNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'trackingNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'tripId': IndexSchema(
      id: 7734156669642746260,
      name: r'tripId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tripId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'syncedAt': IndexSchema(
      id: -9141336850758009100,
      name: r'syncedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _shipmentLocalGetId,
  getLinks: _shipmentLocalGetLinks,
  attach: _shipmentLocalAttach,
  version: '3.1.0+1',
);

int _shipmentLocalEstimateSize(
  ShipmentLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.carrier;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.destination;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.orderId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.origin;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.shipmentId.length * 3;
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.trackingNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tripId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _shipmentLocalSerialize(
  ShipmentLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualArrival);
  writer.writeDateTime(offsets[1], object.actualDeparture);
  writer.writeString(offsets[2], object.carrier);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.destination);
  writer.writeDateTime(offsets[5], object.estimatedArrival);
  writer.writeDateTime(offsets[6], object.estimatedDeparture);
  writer.writeBool(offsets[7], object.isDeleted);
  writer.writeString(offsets[8], object.orderId);
  writer.writeString(offsets[9], object.origin);
  writer.writeString(offsets[10], object.shipmentId);
  writer.writeString(offsets[11], object.status);
  writer.writeDateTime(offsets[12], object.syncedAt);
  writer.writeString(offsets[13], object.trackingNumber);
  writer.writeString(offsets[14], object.tripId);
  writer.writeDateTime(offsets[15], object.updatedAt);
}

ShipmentLocal _shipmentLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ShipmentLocal();
  object.actualArrival = reader.readDateTimeOrNull(offsets[0]);
  object.actualDeparture = reader.readDateTimeOrNull(offsets[1]);
  object.carrier = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTimeOrNull(offsets[3]);
  object.destination = reader.readStringOrNull(offsets[4]);
  object.estimatedArrival = reader.readDateTimeOrNull(offsets[5]);
  object.estimatedDeparture = reader.readDateTimeOrNull(offsets[6]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[7]);
  object.orderId = reader.readStringOrNull(offsets[8]);
  object.origin = reader.readStringOrNull(offsets[9]);
  object.shipmentId = reader.readString(offsets[10]);
  object.status = reader.readStringOrNull(offsets[11]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[12]);
  object.trackingNumber = reader.readStringOrNull(offsets[13]);
  object.tripId = reader.readStringOrNull(offsets[14]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[15]);
  return object;
}

P _shipmentLocalDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _shipmentLocalGetId(ShipmentLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shipmentLocalGetLinks(ShipmentLocal object) {
  return [];
}

void _shipmentLocalAttach(
    IsarCollection<dynamic> col, Id id, ShipmentLocal object) {
  object.id = id;
}

extension ShipmentLocalByIndex on IsarCollection<ShipmentLocal> {
  Future<ShipmentLocal?> getByShipmentId(String shipmentId) {
    return getByIndex(r'shipmentId', [shipmentId]);
  }

  ShipmentLocal? getByShipmentIdSync(String shipmentId) {
    return getByIndexSync(r'shipmentId', [shipmentId]);
  }

  Future<bool> deleteByShipmentId(String shipmentId) {
    return deleteByIndex(r'shipmentId', [shipmentId]);
  }

  bool deleteByShipmentIdSync(String shipmentId) {
    return deleteByIndexSync(r'shipmentId', [shipmentId]);
  }

  Future<List<ShipmentLocal?>> getAllByShipmentId(
      List<String> shipmentIdValues) {
    final values = shipmentIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'shipmentId', values);
  }

  List<ShipmentLocal?> getAllByShipmentIdSync(List<String> shipmentIdValues) {
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

  Future<Id> putByShipmentId(ShipmentLocal object) {
    return putByIndex(r'shipmentId', object);
  }

  Id putByShipmentIdSync(ShipmentLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'shipmentId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByShipmentId(List<ShipmentLocal> objects) {
    return putAllByIndex(r'shipmentId', objects);
  }

  List<Id> putAllByShipmentIdSync(List<ShipmentLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'shipmentId', objects, saveLinks: saveLinks);
  }
}

extension ShipmentLocalQueryWhereSort
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QWhere> {
  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhere> anySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncedAt'),
      );
    });
  }
}

extension ShipmentLocalQueryWhere
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QWhereClause> {
  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      shipmentIdEqualTo(String shipmentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'shipmentId',
        value: [shipmentId],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      orderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      orderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'orderId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> orderIdEqualTo(
      String? orderId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'orderId',
        value: [orderId],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      orderIdNotEqualTo(String? orderId) {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      trackingNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'trackingNumber',
        value: [null],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      trackingNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'trackingNumber',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      trackingNumberEqualTo(String? trackingNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'trackingNumber',
        value: [trackingNumber],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      trackingNumberNotEqualTo(String? trackingNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trackingNumber',
              lower: [],
              upper: [trackingNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trackingNumber',
              lower: [trackingNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trackingNumber',
              lower: [trackingNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trackingNumber',
              lower: [],
              upper: [trackingNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> tripIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tripId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      tripIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tripId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> tripIdEqualTo(
      String? tripId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tripId',
        value: [tripId],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      tripIdNotEqualTo(String? tripId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [],
              upper: [tripId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [tripId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [tripId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tripId',
              lower: [],
              upper: [tripId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> syncedAtEqualTo(
      DateTime? syncedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [syncedAt],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      syncedAtNotEqualTo(DateTime? syncedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [],
              upper: [syncedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [syncedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [syncedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'syncedAt',
              lower: [],
              upper: [syncedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      syncedAtGreaterThan(
    DateTime? syncedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [syncedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause>
      syncedAtLessThan(
    DateTime? syncedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [],
        upper: [syncedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterWhereClause> syncedAtBetween(
    DateTime? lowerSyncedAt,
    DateTime? upperSyncedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'syncedAt',
        lower: [lowerSyncedAt],
        includeLower: includeLower,
        upper: [upperSyncedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ShipmentLocalQueryFilter
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QFilterCondition> {
  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualArrivalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualArrival',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualArrivalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualArrival',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualArrivalEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualArrivalGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualArrivalLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualArrivalBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualArrival',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualDepartureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualDeparture',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualDepartureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualDeparture',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualDepartureEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualDepartureGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualDepartureLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      actualDepartureBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualDeparture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carrier',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carrier',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierEqualTo(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierGreaterThan(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierLessThan(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'carrier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'carrier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carrier',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      carrierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'carrier',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'destination',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destination',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destination',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      destinationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedArrivalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedArrival',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedArrivalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedArrival',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedArrivalEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedArrivalGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedArrivalLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedArrival',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedArrivalBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedArrival',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedDepartureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedDeparture',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedDepartureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedDeparture',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedDepartureEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedDepartureGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedDepartureLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedDeparture',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      estimatedDepartureBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedDeparture',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderId',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderId',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdEqualTo(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdGreaterThan(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdLessThan(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      orderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'origin',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'origin',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'origin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'origin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      originIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      shipmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shipmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      shipmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shipmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      shipmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      shipmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shipmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusEqualTo(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusLessThan(
    String? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      syncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      syncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      syncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'trackingNumber',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'trackingNumber',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackingNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trackingNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trackingNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trackingNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trackingNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trackingNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trackingNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trackingNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trackingNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      trackingNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trackingNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tripId',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tripId',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tripId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tripId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tripId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tripId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      tripIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tripId',
        value: '',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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
}

extension ShipmentLocalQueryObject
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QFilterCondition> {}

extension ShipmentLocalQueryLinks
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QFilterCondition> {}

extension ShipmentLocalQuerySortBy
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QSortBy> {
  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByActualArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByActualArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByActualDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByActualDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByCarrier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByCarrierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByEstimatedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByEstimatedArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByEstimatedDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeparture', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByEstimatedDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeparture', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByTrackingNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackingNumber', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByTrackingNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackingNumber', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ShipmentLocalQuerySortThenBy
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QSortThenBy> {
  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByActualArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByActualArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualArrival', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByActualDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByActualDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualDeparture', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByCarrier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByCarrierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carrier', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByEstimatedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByEstimatedArrivalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedArrival', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByEstimatedDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeparture', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByEstimatedDepartureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDeparture', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderId', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByShipmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByShipmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shipmentId', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByTrackingNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackingNumber', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByTrackingNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trackingNumber', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByTripId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByTripIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tripId', Sort.desc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ShipmentLocalQueryWhereDistinct
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> {
  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct>
      distinctByActualArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualArrival');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct>
      distinctByActualDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualDeparture');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByCarrier(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carrier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByDestination(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destination', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct>
      distinctByEstimatedArrival() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedArrival');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct>
      distinctByEstimatedDeparture() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDeparture');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByOrderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByOrigin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'origin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByShipmentId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shipmentId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct>
      distinctByTrackingNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trackingNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByTripId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tripId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ShipmentLocal, ShipmentLocal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ShipmentLocalQueryProperty
    on QueryBuilder<ShipmentLocal, ShipmentLocal, QQueryProperty> {
  QueryBuilder<ShipmentLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations>
      actualArrivalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualArrival');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations>
      actualDepartureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualDeparture');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations> carrierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carrier');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations> destinationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destination');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations>
      estimatedArrivalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedArrival');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations>
      estimatedDepartureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDeparture');
    });
  }

  QueryBuilder<ShipmentLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations> orderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderId');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations> originProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'origin');
    });
  }

  QueryBuilder<ShipmentLocal, String, QQueryOperations> shipmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shipmentId');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations>
      trackingNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trackingNumber');
    });
  }

  QueryBuilder<ShipmentLocal, String?, QQueryOperations> tripIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tripId');
    });
  }

  QueryBuilder<ShipmentLocal, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
