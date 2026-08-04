// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gara_vehicle.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGaraVehicleCollection on Isar {
  IsarCollection<GaraVehicle> get garaVehicles => this.collection();
}

const GaraVehicleSchema = CollectionSchema(
  name: r'GaraVehicle',
  id: 9063149940638354844,
  properties: {
    r'brand': PropertySchema(
      id: 0,
      name: r'brand',
      type: IsarType.string,
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
    r'engineNumber': PropertySchema(
      id: 3,
      name: r'engineNumber',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'licensePlate': PropertySchema(
      id: 5,
      name: r'licensePlate',
      type: IsarType.string,
    ),
    r'modelName': PropertySchema(
      id: 6,
      name: r'modelName',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleId': PropertySchema(
      id: 8,
      name: r'vehicleId',
      type: IsarType.string,
    ),
    r'version': PropertySchema(
      id: 9,
      name: r'version',
      type: IsarType.long,
    ),
    r'vin': PropertySchema(
      id: 10,
      name: r'vin',
      type: IsarType.string,
    )
  },
  estimateSize: _garaVehicleEstimateSize,
  serialize: _garaVehicleSerialize,
  deserialize: _garaVehicleDeserialize,
  deserializeProp: _garaVehicleDeserializeProp,
  idName: r'id',
  indexes: {
    r'vehicleId': IndexSchema(
      id: 2011968157433523416,
      name: r'vehicleId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'vehicleId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'owner': LinkSchema(
      id: 6823298314833534017,
      name: r'owner',
      target: r'GaraCustomer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _garaVehicleGetId,
  getLinks: _garaVehicleGetLinks,
  attach: _garaVehicleAttach,
  version: '3.1.0+1',
);

int _garaVehicleEstimateSize(
  GaraVehicle object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.brand.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.engineNumber.length * 3;
  bytesCount += 3 + object.licensePlate.length * 3;
  bytesCount += 3 + object.modelName.length * 3;
  bytesCount += 3 + object.vehicleId.length * 3;
  bytesCount += 3 + object.vin.length * 3;
  return bytesCount;
}

void _garaVehicleSerialize(
  GaraVehicle object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.brand);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeString(offsets[3], object.engineNumber);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeString(offsets[5], object.licensePlate);
  writer.writeString(offsets[6], object.modelName);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeString(offsets[8], object.vehicleId);
  writer.writeLong(offsets[9], object.version);
  writer.writeString(offsets[10], object.vin);
}

GaraVehicle _garaVehicleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GaraVehicle();
  object.brand = reader.readString(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.engineNumber = reader.readString(offsets[3]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[4]);
  object.licensePlate = reader.readString(offsets[5]);
  object.modelName = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.vehicleId = reader.readString(offsets[8]);
  object.version = reader.readLong(offsets[9]);
  object.vin = reader.readString(offsets[10]);
  return object;
}

P _garaVehicleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _garaVehicleGetId(GaraVehicle object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _garaVehicleGetLinks(GaraVehicle object) {
  return [object.owner];
}

void _garaVehicleAttach(
    IsarCollection<dynamic> col, Id id, GaraVehicle object) {
  object.id = id;
  object.owner.attach(col, col.isar.collection<GaraCustomer>(), r'owner', id);
}

extension GaraVehicleByIndex on IsarCollection<GaraVehicle> {
  Future<GaraVehicle?> getByVehicleId(String vehicleId) {
    return getByIndex(r'vehicleId', [vehicleId]);
  }

  GaraVehicle? getByVehicleIdSync(String vehicleId) {
    return getByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<bool> deleteByVehicleId(String vehicleId) {
    return deleteByIndex(r'vehicleId', [vehicleId]);
  }

  bool deleteByVehicleIdSync(String vehicleId) {
    return deleteByIndexSync(r'vehicleId', [vehicleId]);
  }

  Future<List<GaraVehicle?>> getAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'vehicleId', values);
  }

  List<GaraVehicle?> getAllByVehicleIdSync(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'vehicleId', values);
  }

  Future<int> deleteAllByVehicleId(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'vehicleId', values);
  }

  int deleteAllByVehicleIdSync(List<String> vehicleIdValues) {
    final values = vehicleIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'vehicleId', values);
  }

  Future<Id> putByVehicleId(GaraVehicle object) {
    return putByIndex(r'vehicleId', object);
  }

  Id putByVehicleIdSync(GaraVehicle object, {bool saveLinks = true}) {
    return putByIndexSync(r'vehicleId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVehicleId(List<GaraVehicle> objects) {
    return putAllByIndex(r'vehicleId', objects);
  }

  List<Id> putAllByVehicleIdSync(List<GaraVehicle> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'vehicleId', objects, saveLinks: saveLinks);
  }
}

extension GaraVehicleQueryWhereSort
    on QueryBuilder<GaraVehicle, GaraVehicle, QWhere> {
  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GaraVehicleQueryWhere
    on QueryBuilder<GaraVehicle, GaraVehicle, QWhereClause> {
  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> idBetween(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> vehicleIdEqualTo(
      String vehicleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'vehicleId',
        value: [vehicleId],
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterWhereClause> vehicleIdNotEqualTo(
      String vehicleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [],
              upper: [vehicleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [vehicleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [vehicleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'vehicleId',
              lower: [],
              upper: [vehicleId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GaraVehicleQueryFilter
    on QueryBuilder<GaraVehicle, GaraVehicle, QFilterCondition> {
  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      brandGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'brand',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'brand',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'brand',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> brandIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      brandIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'brand',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> deviceIdMatches(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'engineNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'engineNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'engineNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'engineNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      engineNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'engineNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licensePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      licensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'modelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'modelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      modelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'modelName',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> versionBetween(
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

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> vinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vin',
        value: '',
      ));
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition>
      vinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vin',
        value: '',
      ));
    });
  }
}

extension GaraVehicleQueryObject
    on QueryBuilder<GaraVehicle, GaraVehicle, QFilterCondition> {}

extension GaraVehicleQueryLinks
    on QueryBuilder<GaraVehicle, GaraVehicle, QFilterCondition> {
  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> owner(
      FilterQuery<GaraCustomer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'owner');
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterFilterCondition> ownerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'owner', 0, true, 0, true);
    });
  }
}

extension GaraVehicleQuerySortBy
    on QueryBuilder<GaraVehicle, GaraVehicle, QSortBy> {
  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByEngineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy>
      sortByEngineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy>
      sortByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByVin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vin', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> sortByVinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vin', Sort.desc);
    });
  }
}

extension GaraVehicleQuerySortThenBy
    on QueryBuilder<GaraVehicle, GaraVehicle, QSortThenBy> {
  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByBrand() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByBrandDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brand', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByEngineNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy>
      thenByEngineNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'engineNumber', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy>
      thenByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByVin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vin', Sort.asc);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QAfterSortBy> thenByVinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vin', Sort.desc);
    });
  }
}

extension GaraVehicleQueryWhereDistinct
    on QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> {
  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByBrand(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brand', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByEngineNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'engineNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByLicensePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licensePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByModelName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<GaraVehicle, GaraVehicle, QDistinct> distinctByVin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vin', caseSensitive: caseSensitive);
    });
  }
}

extension GaraVehicleQueryProperty
    on QueryBuilder<GaraVehicle, GaraVehicle, QQueryProperty> {
  QueryBuilder<GaraVehicle, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> brandProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brand');
    });
  }

  QueryBuilder<GaraVehicle, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> engineNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'engineNumber');
    });
  }

  QueryBuilder<GaraVehicle, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> licensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licensePlate');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<GaraVehicle, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }

  QueryBuilder<GaraVehicle, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<GaraVehicle, String, QQueryOperations> vinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vin');
    });
  }
}
