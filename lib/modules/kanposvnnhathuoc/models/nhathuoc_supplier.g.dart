// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhathuoc_supplier.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocSupplierCollection on Isar {
  IsarCollection<NhathuocSupplier> get nhathuocSuppliers => this.collection();
}

const NhathuocSupplierSchema = CollectionSchema(
  name: r'NhathuocSupplier',
  id: -4272775749184639962,
  properties: {
    r'currentDebt': PropertySchema(
      id: 0,
      name: r'currentDebt',
      type: IsarType.double,
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
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 5,
      name: r'phone',
      type: IsarType.string,
    ),
    r'supplierId': PropertySchema(
      id: 6,
      name: r'supplierId',
      type: IsarType.string,
    ),
    r'taxCode': PropertySchema(
      id: 7,
      name: r'taxCode',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 9,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _nhathuocSupplierEstimateSize,
  serialize: _nhathuocSupplierSerialize,
  deserialize: _nhathuocSupplierDeserialize,
  deserializeProp: _nhathuocSupplierDeserializeProp,
  idName: r'id',
  indexes: {
    r'supplierId': IndexSchema(
      id: -7509772217447508349,
      name: r'supplierId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'supplierId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nhathuocSupplierGetId,
  getLinks: _nhathuocSupplierGetLinks,
  attach: _nhathuocSupplierAttach,
  version: '3.1.0+1',
);

int _nhathuocSupplierEstimateSize(
  NhathuocSupplier object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.supplierId.length * 3;
  bytesCount += 3 + object.taxCode.length * 3;
  return bytesCount;
}

void _nhathuocSupplierSerialize(
  NhathuocSupplier object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.currentDebt);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.phone);
  writer.writeString(offsets[6], object.supplierId);
  writer.writeString(offsets[7], object.taxCode);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeLong(offsets[9], object.version);
}

NhathuocSupplier _nhathuocSupplierDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocSupplier();
  object.currentDebt = reader.readDouble(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.phone = reader.readString(offsets[5]);
  object.supplierId = reader.readString(offsets[6]);
  object.taxCode = reader.readString(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.version = reader.readLong(offsets[9]);
  return object;
}

P _nhathuocSupplierDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocSupplierGetId(NhathuocSupplier object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocSupplierGetLinks(NhathuocSupplier object) {
  return [];
}

void _nhathuocSupplierAttach(
    IsarCollection<dynamic> col, Id id, NhathuocSupplier object) {
  object.id = id;
}

extension NhathuocSupplierByIndex on IsarCollection<NhathuocSupplier> {
  Future<NhathuocSupplier?> getBySupplierId(String supplierId) {
    return getByIndex(r'supplierId', [supplierId]);
  }

  NhathuocSupplier? getBySupplierIdSync(String supplierId) {
    return getByIndexSync(r'supplierId', [supplierId]);
  }

  Future<bool> deleteBySupplierId(String supplierId) {
    return deleteByIndex(r'supplierId', [supplierId]);
  }

  bool deleteBySupplierIdSync(String supplierId) {
    return deleteByIndexSync(r'supplierId', [supplierId]);
  }

  Future<List<NhathuocSupplier?>> getAllBySupplierId(
      List<String> supplierIdValues) {
    final values = supplierIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'supplierId', values);
  }

  List<NhathuocSupplier?> getAllBySupplierIdSync(
      List<String> supplierIdValues) {
    final values = supplierIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'supplierId', values);
  }

  Future<int> deleteAllBySupplierId(List<String> supplierIdValues) {
    final values = supplierIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'supplierId', values);
  }

  int deleteAllBySupplierIdSync(List<String> supplierIdValues) {
    final values = supplierIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'supplierId', values);
  }

  Future<Id> putBySupplierId(NhathuocSupplier object) {
    return putByIndex(r'supplierId', object);
  }

  Id putBySupplierIdSync(NhathuocSupplier object, {bool saveLinks = true}) {
    return putByIndexSync(r'supplierId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySupplierId(List<NhathuocSupplier> objects) {
    return putAllByIndex(r'supplierId', objects);
  }

  List<Id> putAllBySupplierIdSync(List<NhathuocSupplier> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'supplierId', objects, saveLinks: saveLinks);
  }
}

extension NhathuocSupplierQueryWhereSort
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QWhere> {
  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocSupplierQueryWhere
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QWhereClause> {
  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause> idBetween(
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause>
      supplierIdEqualTo(String supplierId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supplierId',
        value: [supplierId],
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterWhereClause>
      supplierIdNotEqualTo(String supplierId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierId',
              lower: [],
              upper: [supplierId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierId',
              lower: [supplierId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierId',
              lower: [supplierId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierId',
              lower: [],
              upper: [supplierId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NhathuocSupplierQueryFilter
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QFilterCondition> {
  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      currentDebtEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      currentDebtGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      currentDebtLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      currentDebtBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentDebt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supplierId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supplierId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      supplierIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supplierId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      taxCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxCode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterFilterCondition>
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

extension NhathuocSupplierQueryObject
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QFilterCondition> {}

extension NhathuocSupplierQueryLinks
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QFilterCondition> {}

extension NhathuocSupplierQuerySortBy
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QSortBy> {
  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByCurrentDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension NhathuocSupplierQuerySortThenBy
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QSortThenBy> {
  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByCurrentDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByTaxCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByTaxCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxCode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension NhathuocSupplierQueryWhereDistinct
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct> {
  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentDebt');
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctBySupplierId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct> distinctByTaxCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NhathuocSupplier, NhathuocSupplier, QDistinct>
      distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension NhathuocSupplierQueryProperty
    on QueryBuilder<NhathuocSupplier, NhathuocSupplier, QQueryProperty> {
  QueryBuilder<NhathuocSupplier, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocSupplier, double, QQueryOperations>
      currentDebtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentDebt');
    });
  }

  QueryBuilder<NhathuocSupplier, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<NhathuocSupplier, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<NhathuocSupplier, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<NhathuocSupplier, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<NhathuocSupplier, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<NhathuocSupplier, String, QQueryOperations>
      supplierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierId');
    });
  }

  QueryBuilder<NhathuocSupplier, String, QQueryOperations> taxCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxCode');
    });
  }

  QueryBuilder<NhathuocSupplier, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NhathuocSupplier, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
