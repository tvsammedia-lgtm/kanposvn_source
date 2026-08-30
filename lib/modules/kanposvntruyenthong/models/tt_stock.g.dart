// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tt_stock.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTtStockLotCollection on Isar {
  IsarCollection<TtStockLot> get ttStockLots => this.collection();
}

const TtStockLotSchema = CollectionSchema(
  name: r'TtStockLot',
  id: 1349303593526777923,
  properties: {
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 1,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'expiryDate': PropertySchema(
      id: 2,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lotId': PropertySchema(
      id: 4,
      name: r'lotId',
      type: IsarType.string,
    ),
    r'lotNumber': PropertySchema(
      id: 5,
      name: r'lotNumber',
      type: IsarType.string,
    ),
    r'purchaseDate': PropertySchema(
      id: 6,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'quantityIn': PropertySchema(
      id: 7,
      name: r'quantityIn',
      type: IsarType.double,
    ),
    r'quantityOut': PropertySchema(
      id: 8,
      name: r'quantityOut',
      type: IsarType.double,
    ),
    r'quantityRemaining': PropertySchema(
      id: 9,
      name: r'quantityRemaining',
      type: IsarType.double,
    ),
    r'unitCost': PropertySchema(
      id: 10,
      name: r'unitCost',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 12,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _ttStockLotEstimateSize,
  serialize: _ttStockLotSerialize,
  deserialize: _ttStockLotDeserialize,
  deserializeProp: _ttStockLotDeserializeProp,
  idName: r'id',
  indexes: {
    r'lotId': IndexSchema(
      id: 7594258205857764483,
      name: r'lotId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'lotId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'product': LinkSchema(
      id: 4111832173209480941,
      name: r'product',
      target: r'TtProduct',
      single: true,
    ),
    r'supplier': LinkSchema(
      id: -1342843797977714399,
      name: r'supplier',
      target: r'TtSupplier',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _ttStockLotGetId,
  getLinks: _ttStockLotGetLinks,
  attach: _ttStockLotAttach,
  version: '3.1.0+1',
);

int _ttStockLotEstimateSize(
  TtStockLot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.lotId.length * 3;
  bytesCount += 3 + object.lotNumber.length * 3;
  return bytesCount;
}

void _ttStockLotSerialize(
  TtStockLot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeDateTime(offsets[2], object.expiryDate);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.lotId);
  writer.writeString(offsets[5], object.lotNumber);
  writer.writeDateTime(offsets[6], object.purchaseDate);
  writer.writeDouble(offsets[7], object.quantityIn);
  writer.writeDouble(offsets[8], object.quantityOut);
  writer.writeDouble(offsets[9], object.quantityRemaining);
  writer.writeDouble(offsets[10], object.unitCost);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeLong(offsets[12], object.version);
}

TtStockLot _ttStockLotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TtStockLot();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.expiryDate = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.lotId = reader.readString(offsets[4]);
  object.lotNumber = reader.readString(offsets[5]);
  object.purchaseDate = reader.readDateTime(offsets[6]);
  object.quantityIn = reader.readDouble(offsets[7]);
  object.quantityOut = reader.readDouble(offsets[8]);
  object.quantityRemaining = reader.readDouble(offsets[9]);
  object.unitCost = reader.readDouble(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  object.version = reader.readLong(offsets[12]);
  return object;
}

P _ttStockLotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ttStockLotGetId(TtStockLot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ttStockLotGetLinks(TtStockLot object) {
  return [object.product, object.supplier];
}

void _ttStockLotAttach(IsarCollection<dynamic> col, Id id, TtStockLot object) {
  object.id = id;
  object.product.attach(col, col.isar.collection<TtProduct>(), r'product', id);
  object.supplier
      .attach(col, col.isar.collection<TtSupplier>(), r'supplier', id);
}

extension TtStockLotByIndex on IsarCollection<TtStockLot> {
  Future<TtStockLot?> getByLotId(String lotId) {
    return getByIndex(r'lotId', [lotId]);
  }

  TtStockLot? getByLotIdSync(String lotId) {
    return getByIndexSync(r'lotId', [lotId]);
  }

  Future<bool> deleteByLotId(String lotId) {
    return deleteByIndex(r'lotId', [lotId]);
  }

  bool deleteByLotIdSync(String lotId) {
    return deleteByIndexSync(r'lotId', [lotId]);
  }

  Future<List<TtStockLot?>> getAllByLotId(List<String> lotIdValues) {
    final values = lotIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'lotId', values);
  }

  List<TtStockLot?> getAllByLotIdSync(List<String> lotIdValues) {
    final values = lotIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'lotId', values);
  }

  Future<int> deleteAllByLotId(List<String> lotIdValues) {
    final values = lotIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'lotId', values);
  }

  int deleteAllByLotIdSync(List<String> lotIdValues) {
    final values = lotIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'lotId', values);
  }

  Future<Id> putByLotId(TtStockLot object) {
    return putByIndex(r'lotId', object);
  }

  Id putByLotIdSync(TtStockLot object, {bool saveLinks = true}) {
    return putByIndexSync(r'lotId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLotId(List<TtStockLot> objects) {
    return putAllByIndex(r'lotId', objects);
  }

  List<Id> putAllByLotIdSync(List<TtStockLot> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'lotId', objects, saveLinks: saveLinks);
  }
}

extension TtStockLotQueryWhereSort
    on QueryBuilder<TtStockLot, TtStockLot, QWhere> {
  QueryBuilder<TtStockLot, TtStockLot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TtStockLotQueryWhere
    on QueryBuilder<TtStockLot, TtStockLot, QWhereClause> {
  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> idBetween(
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> lotIdEqualTo(
      String lotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lotId',
        value: [lotId],
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterWhereClause> lotIdNotEqualTo(
      String lotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId',
              lower: [],
              upper: [lotId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId',
              lower: [lotId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId',
              lower: [lotId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lotId',
              lower: [],
              upper: [lotId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TtStockLotQueryFilter
    on QueryBuilder<TtStockLot, TtStockLot, QFilterCondition> {
  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deviceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> deviceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> expiryDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lotId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      lotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lotId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      lotNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lotNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      lotNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> lotNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lotNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      lotNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      lotNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      purchaseDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      purchaseDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> quantityInEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityInGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityInLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityIn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> quantityInBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityIn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityOutEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityOutGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityOutLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityOut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityOutBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityOut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityRemainingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityRemaining',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityRemainingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityRemaining',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityRemainingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityRemaining',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      quantityRemainingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityRemaining',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> unitCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      unitCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> unitCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> unitCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TtStockLotQueryObject
    on QueryBuilder<TtStockLot, TtStockLot, QFilterCondition> {}

extension TtStockLotQueryLinks
    on QueryBuilder<TtStockLot, TtStockLot, QFilterCondition> {
  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> product(
      FilterQuery<TtProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> supplier(
      FilterQuery<TtSupplier> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'supplier');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterFilterCondition> supplierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'supplier', 0, true, 0, true);
    });
  }
}

extension TtStockLotQuerySortBy
    on QueryBuilder<TtStockLot, TtStockLot, QSortBy> {
  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByLotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByLotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByLotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByLotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByQuantityIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityIn', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByQuantityInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityIn', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByQuantityOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOut', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByQuantityOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOut', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByQuantityRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityRemaining', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy>
      sortByQuantityRemainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityRemaining', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByUnitCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtStockLotQuerySortThenBy
    on QueryBuilder<TtStockLot, TtStockLot, QSortThenBy> {
  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByLotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByLotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotId', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByLotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByLotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lotNumber', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByQuantityIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityIn', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByQuantityInDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityIn', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByQuantityOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOut', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByQuantityOutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityOut', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByQuantityRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityRemaining', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy>
      thenByQuantityRemainingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantityRemaining', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByUnitCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtStockLotQueryWhereDistinct
    on QueryBuilder<TtStockLot, TtStockLot, QDistinct> {
  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByLotId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lotId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByLotNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lotNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByQuantityIn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityIn');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByQuantityOut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityOut');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct>
      distinctByQuantityRemaining() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantityRemaining');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitCost');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TtStockLot, TtStockLot, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TtStockLotQueryProperty
    on QueryBuilder<TtStockLot, TtStockLot, QQueryProperty> {
  QueryBuilder<TtStockLot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TtStockLot, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TtStockLot, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TtStockLot, DateTime?, QQueryOperations> expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<TtStockLot, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TtStockLot, String, QQueryOperations> lotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lotId');
    });
  }

  QueryBuilder<TtStockLot, String, QQueryOperations> lotNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lotNumber');
    });
  }

  QueryBuilder<TtStockLot, DateTime, QQueryOperations> purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<TtStockLot, double, QQueryOperations> quantityInProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityIn');
    });
  }

  QueryBuilder<TtStockLot, double, QQueryOperations> quantityOutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityOut');
    });
  }

  QueryBuilder<TtStockLot, double, QQueryOperations>
      quantityRemainingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantityRemaining');
    });
  }

  QueryBuilder<TtStockLot, double, QQueryOperations> unitCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitCost');
    });
  }

  QueryBuilder<TtStockLot, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TtStockLot, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTtStockIssueCollection on Isar {
  IsarCollection<TtStockIssue> get ttStockIssues => this.collection();
}

const TtStockIssueSchema = CollectionSchema(
  name: r'TtStockIssue',
  id: -7088818594002742709,
  properties: {
    r'createdBy': PropertySchema(
      id: 0,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 2,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 3,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'issueId': PropertySchema(
      id: 5,
      name: r'issueId',
      type: IsarType.string,
    ),
    r'issueNumber': PropertySchema(
      id: 6,
      name: r'issueNumber',
      type: IsarType.string,
    ),
    r'issueType': PropertySchema(
      id: 7,
      name: r'issueType',
      type: IsarType.byte,
      enumMap: _TtStockIssueissueTypeEnumValueMap,
    ),
    r'note': PropertySchema(
      id: 8,
      name: r'note',
      type: IsarType.string,
    ),
    r'totalCost': PropertySchema(
      id: 9,
      name: r'totalCost',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 11,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _ttStockIssueEstimateSize,
  serialize: _ttStockIssueSerialize,
  deserialize: _ttStockIssueDeserialize,
  deserializeProp: _ttStockIssueDeserializeProp,
  idName: r'id',
  indexes: {
    r'issueId': IndexSchema(
      id: 5757504287753914139,
      name: r'issueId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'issueId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ttStockIssueGetId,
  getLinks: _ttStockIssueGetLinks,
  attach: _ttStockIssueAttach,
  version: '3.1.0+1',
);

int _ttStockIssueEstimateSize(
  TtStockIssue object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.createdBy.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.issueId.length * 3;
  bytesCount += 3 + object.issueNumber.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _ttStockIssueSerialize(
  TtStockIssue object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.createdBy);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeDateTime(offsets[2], object.deletedAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.issueId);
  writer.writeString(offsets[6], object.issueNumber);
  writer.writeByte(offsets[7], object.issueType.index);
  writer.writeString(offsets[8], object.note);
  writer.writeDouble(offsets[9], object.totalCost);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.version);
}

TtStockIssue _ttStockIssueDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TtStockIssue();
  object.createdBy = reader.readString(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[4]);
  object.issueId = reader.readString(offsets[5]);
  object.issueNumber = reader.readString(offsets[6]);
  object.issueType =
      _TtStockIssueissueTypeValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          TtIssueType.SALE;
  object.note = reader.readString(offsets[8]);
  object.totalCost = reader.readDouble(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.version = reader.readLong(offsets[11]);
  return object;
}

P _ttStockIssueDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_TtStockIssueissueTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TtIssueType.SALE) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TtStockIssueissueTypeEnumValueMap = {
  'SALE': 0,
  'RETURN_SUPPLIER': 1,
  'WASTE': 2,
  'DAMAGE': 3,
  'INTERNAL_USE': 4,
  'ADJUSTMENT': 5,
};
const _TtStockIssueissueTypeValueEnumMap = {
  0: TtIssueType.SALE,
  1: TtIssueType.RETURN_SUPPLIER,
  2: TtIssueType.WASTE,
  3: TtIssueType.DAMAGE,
  4: TtIssueType.INTERNAL_USE,
  5: TtIssueType.ADJUSTMENT,
};

Id _ttStockIssueGetId(TtStockIssue object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ttStockIssueGetLinks(TtStockIssue object) {
  return [];
}

void _ttStockIssueAttach(
    IsarCollection<dynamic> col, Id id, TtStockIssue object) {
  object.id = id;
}

extension TtStockIssueByIndex on IsarCollection<TtStockIssue> {
  Future<TtStockIssue?> getByIssueId(String issueId) {
    return getByIndex(r'issueId', [issueId]);
  }

  TtStockIssue? getByIssueIdSync(String issueId) {
    return getByIndexSync(r'issueId', [issueId]);
  }

  Future<bool> deleteByIssueId(String issueId) {
    return deleteByIndex(r'issueId', [issueId]);
  }

  bool deleteByIssueIdSync(String issueId) {
    return deleteByIndexSync(r'issueId', [issueId]);
  }

  Future<List<TtStockIssue?>> getAllByIssueId(List<String> issueIdValues) {
    final values = issueIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'issueId', values);
  }

  List<TtStockIssue?> getAllByIssueIdSync(List<String> issueIdValues) {
    final values = issueIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'issueId', values);
  }

  Future<int> deleteAllByIssueId(List<String> issueIdValues) {
    final values = issueIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'issueId', values);
  }

  int deleteAllByIssueIdSync(List<String> issueIdValues) {
    final values = issueIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'issueId', values);
  }

  Future<Id> putByIssueId(TtStockIssue object) {
    return putByIndex(r'issueId', object);
  }

  Id putByIssueIdSync(TtStockIssue object, {bool saveLinks = true}) {
    return putByIndexSync(r'issueId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIssueId(List<TtStockIssue> objects) {
    return putAllByIndex(r'issueId', objects);
  }

  List<Id> putAllByIssueIdSync(List<TtStockIssue> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'issueId', objects, saveLinks: saveLinks);
  }
}

extension TtStockIssueQueryWhereSort
    on QueryBuilder<TtStockIssue, TtStockIssue, QWhere> {
  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TtStockIssueQueryWhere
    on QueryBuilder<TtStockIssue, TtStockIssue, QWhereClause> {
  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> idBetween(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> issueIdEqualTo(
      String issueId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issueId',
        value: [issueId],
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterWhereClause> issueIdNotEqualTo(
      String issueId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issueId',
              lower: [],
              upper: [issueId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issueId',
              lower: [issueId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issueId',
              lower: [issueId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issueId',
              lower: [],
              upper: [issueId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TtStockIssueQueryFilter
    on QueryBuilder<TtStockIssue, TtStockIssue, QFilterCondition> {
  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issueId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issueId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issueNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issueNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issueNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issueNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issueNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueTypeEqualTo(TtIssueType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issueType',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueTypeGreaterThan(
    TtIssueType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issueType',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueTypeLessThan(
    TtIssueType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issueType',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      issueTypeBetween(
    TtIssueType lower,
    TtIssueType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issueType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      noteGreaterThan(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> noteBetween(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      noteStartsWith(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      totalCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      totalCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      totalCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      totalCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TtStockIssueQueryObject
    on QueryBuilder<TtStockIssue, TtStockIssue, QFilterCondition> {}

extension TtStockIssueQueryLinks
    on QueryBuilder<TtStockIssue, TtStockIssue, QFilterCondition> {}

extension TtStockIssueQuerySortBy
    on QueryBuilder<TtStockIssue, TtStockIssue, QSortBy> {
  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIssueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueId', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIssueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueId', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIssueNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNumber', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy>
      sortByIssueNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNumber', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIssueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByIssueTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtStockIssueQuerySortThenBy
    on QueryBuilder<TtStockIssue, TtStockIssue, QSortThenBy> {
  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIssueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueId', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIssueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueId', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIssueNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNumber', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy>
      thenByIssueNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueNumber', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIssueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByIssueTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issueType', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtStockIssueQueryWhereDistinct
    on QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> {
  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByIssueId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByIssueNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByIssueType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issueType');
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TtStockIssue, TtStockIssue, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TtStockIssueQueryProperty
    on QueryBuilder<TtStockIssue, TtStockIssue, QQueryProperty> {
  QueryBuilder<TtStockIssue, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TtStockIssue, String, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<TtStockIssue, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<TtStockIssue, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TtStockIssue, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TtStockIssue, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TtStockIssue, String, QQueryOperations> issueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueId');
    });
  }

  QueryBuilder<TtStockIssue, String, QQueryOperations> issueNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueNumber');
    });
  }

  QueryBuilder<TtStockIssue, TtIssueType, QQueryOperations>
      issueTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issueType');
    });
  }

  QueryBuilder<TtStockIssue, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<TtStockIssue, double, QQueryOperations> totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }

  QueryBuilder<TtStockIssue, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TtStockIssue, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTtStockMovementCollection on Isar {
  IsarCollection<TtStockMovement> get ttStockMovements => this.collection();
}

const TtStockMovementSchema = CollectionSchema(
  name: r'TtStockMovement',
  id: 6399796216451629358,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 2,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'movementId': PropertySchema(
      id: 4,
      name: r'movementId',
      type: IsarType.string,
    ),
    r'movementType': PropertySchema(
      id: 5,
      name: r'movementType',
      type: IsarType.byte,
      enumMap: _TtStockMovementmovementTypeEnumValueMap,
    ),
    r'quantity': PropertySchema(
      id: 6,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'referenceId': PropertySchema(
      id: 7,
      name: r'referenceId',
      type: IsarType.string,
    ),
    r'totalCost': PropertySchema(
      id: 8,
      name: r'totalCost',
      type: IsarType.double,
    ),
    r'unitCost': PropertySchema(
      id: 9,
      name: r'unitCost',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 11,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _ttStockMovementEstimateSize,
  serialize: _ttStockMovementSerialize,
  deserialize: _ttStockMovementDeserialize,
  deserializeProp: _ttStockMovementDeserializeProp,
  idName: r'id',
  indexes: {
    r'movementId': IndexSchema(
      id: 1547802813824549110,
      name: r'movementId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'movementId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'product': LinkSchema(
      id: 2747514094613065117,
      name: r'product',
      target: r'TtProduct',
      single: true,
    ),
    r'lot': LinkSchema(
      id: -8819605252427525250,
      name: r'lot',
      target: r'TtStockLot',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _ttStockMovementGetId,
  getLinks: _ttStockMovementGetLinks,
  attach: _ttStockMovementAttach,
  version: '3.1.0+1',
);

int _ttStockMovementEstimateSize(
  TtStockMovement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.movementId.length * 3;
  bytesCount += 3 + object.referenceId.length * 3;
  return bytesCount;
}

void _ttStockMovementSerialize(
  TtStockMovement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.movementId);
  writer.writeByte(offsets[5], object.movementType.index);
  writer.writeDouble(offsets[6], object.quantity);
  writer.writeString(offsets[7], object.referenceId);
  writer.writeDouble(offsets[8], object.totalCost);
  writer.writeDouble(offsets[9], object.unitCost);
  writer.writeDateTime(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.version);
}

TtStockMovement _ttStockMovementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TtStockMovement();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.movementId = reader.readString(offsets[4]);
  object.movementType = _TtStockMovementmovementTypeValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      TtMovementType.PURCHASE;
  object.quantity = reader.readDouble(offsets[6]);
  object.referenceId = reader.readString(offsets[7]);
  object.totalCost = reader.readDouble(offsets[8]);
  object.unitCost = reader.readDouble(offsets[9]);
  object.updatedAt = reader.readDateTime(offsets[10]);
  object.version = reader.readLong(offsets[11]);
  return object;
}

P _ttStockMovementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (_TtStockMovementmovementTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TtMovementType.PURCHASE) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TtStockMovementmovementTypeEnumValueMap = {
  'PURCHASE': 0,
  'SALE': 1,
  'SALE_RETURN': 2,
  'PURCHASE_RETURN': 3,
  'DAMAGE': 4,
  'WASTE': 5,
  'ADJUSTMENT_IN': 6,
  'ADJUSTMENT_OUT': 7,
  'INTERNAL_USE': 8,
};
const _TtStockMovementmovementTypeValueEnumMap = {
  0: TtMovementType.PURCHASE,
  1: TtMovementType.SALE,
  2: TtMovementType.SALE_RETURN,
  3: TtMovementType.PURCHASE_RETURN,
  4: TtMovementType.DAMAGE,
  5: TtMovementType.WASTE,
  6: TtMovementType.ADJUSTMENT_IN,
  7: TtMovementType.ADJUSTMENT_OUT,
  8: TtMovementType.INTERNAL_USE,
};

Id _ttStockMovementGetId(TtStockMovement object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ttStockMovementGetLinks(TtStockMovement object) {
  return [object.product, object.lot];
}

void _ttStockMovementAttach(
    IsarCollection<dynamic> col, Id id, TtStockMovement object) {
  object.id = id;
  object.product.attach(col, col.isar.collection<TtProduct>(), r'product', id);
  object.lot.attach(col, col.isar.collection<TtStockLot>(), r'lot', id);
}

extension TtStockMovementByIndex on IsarCollection<TtStockMovement> {
  Future<TtStockMovement?> getByMovementId(String movementId) {
    return getByIndex(r'movementId', [movementId]);
  }

  TtStockMovement? getByMovementIdSync(String movementId) {
    return getByIndexSync(r'movementId', [movementId]);
  }

  Future<bool> deleteByMovementId(String movementId) {
    return deleteByIndex(r'movementId', [movementId]);
  }

  bool deleteByMovementIdSync(String movementId) {
    return deleteByIndexSync(r'movementId', [movementId]);
  }

  Future<List<TtStockMovement?>> getAllByMovementId(
      List<String> movementIdValues) {
    final values = movementIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'movementId', values);
  }

  List<TtStockMovement?> getAllByMovementIdSync(List<String> movementIdValues) {
    final values = movementIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'movementId', values);
  }

  Future<int> deleteAllByMovementId(List<String> movementIdValues) {
    final values = movementIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'movementId', values);
  }

  int deleteAllByMovementIdSync(List<String> movementIdValues) {
    final values = movementIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'movementId', values);
  }

  Future<Id> putByMovementId(TtStockMovement object) {
    return putByIndex(r'movementId', object);
  }

  Id putByMovementIdSync(TtStockMovement object, {bool saveLinks = true}) {
    return putByIndexSync(r'movementId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMovementId(List<TtStockMovement> objects) {
    return putAllByIndex(r'movementId', objects);
  }

  List<Id> putAllByMovementIdSync(List<TtStockMovement> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'movementId', objects, saveLinks: saveLinks);
  }
}

extension TtStockMovementQueryWhereSort
    on QueryBuilder<TtStockMovement, TtStockMovement, QWhere> {
  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TtStockMovementQueryWhere
    on QueryBuilder<TtStockMovement, TtStockMovement, QWhereClause> {
  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause> idBetween(
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause>
      movementIdEqualTo(String movementId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'movementId',
        value: [movementId],
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterWhereClause>
      movementIdNotEqualTo(String movementId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'movementId',
              lower: [],
              upper: [movementId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'movementId',
              lower: [movementId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'movementId',
              lower: [movementId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'movementId',
              lower: [],
              upper: [movementId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TtStockMovementQueryFilter
    on QueryBuilder<TtStockMovement, TtStockMovement, QFilterCondition> {
  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deletedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deletedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deletedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deletedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movementId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'movementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'movementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'movementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'movementId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movementId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'movementId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementTypeEqualTo(TtMovementType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movementType',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementTypeGreaterThan(
    TtMovementType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movementType',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementTypeLessThan(
    TtMovementType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movementType',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      movementTypeBetween(
    TtMovementType lower,
    TtMovementType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movementType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      referenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      totalCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      totalCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      totalCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      totalCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      unitCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      unitCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      unitCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      unitCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TtStockMovementQueryObject
    on QueryBuilder<TtStockMovement, TtStockMovement, QFilterCondition> {}

extension TtStockMovementQueryLinks
    on QueryBuilder<TtStockMovement, TtStockMovement, QFilterCondition> {
  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition> product(
      FilterQuery<TtProduct> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'product');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      productIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'product', 0, true, 0, true);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition> lot(
      FilterQuery<TtStockLot> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'lot');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterFilterCondition>
      lotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'lot', 0, true, 0, true);
    });
  }
}

extension TtStockMovementQuerySortBy
    on QueryBuilder<TtStockMovement, TtStockMovement, QSortBy> {
  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByMovementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementId', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByMovementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementId', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByMovementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByMovementTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByUnitCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtStockMovementQuerySortThenBy
    on QueryBuilder<TtStockMovement, TtStockMovement, QSortThenBy> {
  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByMovementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementId', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByMovementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementId', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByMovementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByMovementTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByUnitCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCost', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension TtStockMovementQueryWhereDistinct
    on QueryBuilder<TtStockMovement, TtStockMovement, QDistinct> {
  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByMovementId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'movementId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByMovementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'movementType');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByReferenceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByUnitCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitCost');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TtStockMovement, TtStockMovement, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension TtStockMovementQueryProperty
    on QueryBuilder<TtStockMovement, TtStockMovement, QQueryProperty> {
  QueryBuilder<TtStockMovement, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TtStockMovement, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TtStockMovement, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<TtStockMovement, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<TtStockMovement, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<TtStockMovement, String, QQueryOperations> movementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movementId');
    });
  }

  QueryBuilder<TtStockMovement, TtMovementType, QQueryOperations>
      movementTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movementType');
    });
  }

  QueryBuilder<TtStockMovement, double, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<TtStockMovement, String, QQueryOperations>
      referenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceId');
    });
  }

  QueryBuilder<TtStockMovement, double, QQueryOperations> totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }

  QueryBuilder<TtStockMovement, double, QQueryOperations> unitCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitCost');
    });
  }

  QueryBuilder<TtStockMovement, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TtStockMovement, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
