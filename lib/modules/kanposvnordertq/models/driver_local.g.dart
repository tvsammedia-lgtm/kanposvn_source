// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDriverLocalCollection on Isar {
  IsarCollection<DriverLocal> get driverLocals => this.collection();
}

const DriverLocalSchema = CollectionSchema(
  name: r'DriverLocal',
  id: -735175392822544305,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentVehicleId': PropertySchema(
      id: 1,
      name: r'currentVehicleId',
      type: IsarType.string,
    ),
    r'driverCode': PropertySchema(
      id: 2,
      name: r'driverCode',
      type: IsarType.string,
    ),
    r'driverId': PropertySchema(
      id: 3,
      name: r'driverId',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 4,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'licenseExpiry': PropertySchema(
      id: 5,
      name: r'licenseExpiry',
      type: IsarType.dateTime,
    ),
    r'licenseNumber': PropertySchema(
      id: 6,
      name: r'licenseNumber',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 8,
      name: r'phone',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 9,
      name: r'status',
      type: IsarType.string,
    ),
    r'syncedAt': PropertySchema(
      id: 10,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 12,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _driverLocalEstimateSize,
  serialize: _driverLocalSerialize,
  deserialize: _driverLocalDeserialize,
  deserializeProp: _driverLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'driverId': IndexSchema(
      id: -2215465182691497637,
      name: r'driverId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'driverId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'licenseExpiry': IndexSchema(
      id: -6440183322689362598,
      name: r'licenseExpiry',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'licenseExpiry',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'currentVehicleId': IndexSchema(
      id: 2424566645971244220,
      name: r'currentVehicleId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'currentVehicleId',
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
  getId: _driverLocalGetId,
  getLinks: _driverLocalGetLinks,
  attach: _driverLocalAttach,
  version: '3.1.0+1',
);

int _driverLocalEstimateSize(
  DriverLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.currentVehicleId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.driverCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.driverId.length * 3;
  {
    final value = object.licenseNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _driverLocalSerialize(
  DriverLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.currentVehicleId);
  writer.writeString(offsets[2], object.driverCode);
  writer.writeString(offsets[3], object.driverId);
  writer.writeBool(offsets[4], object.isDeleted);
  writer.writeDateTime(offsets[5], object.licenseExpiry);
  writer.writeString(offsets[6], object.licenseNumber);
  writer.writeString(offsets[7], object.name);
  writer.writeString(offsets[8], object.phone);
  writer.writeString(offsets[9], object.status);
  writer.writeDateTime(offsets[10], object.syncedAt);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.userId);
}

DriverLocal _driverLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DriverLocal();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.currentVehicleId = reader.readStringOrNull(offsets[1]);
  object.driverCode = reader.readStringOrNull(offsets[2]);
  object.driverId = reader.readString(offsets[3]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[4]);
  object.licenseExpiry = reader.readDateTimeOrNull(offsets[5]);
  object.licenseNumber = reader.readStringOrNull(offsets[6]);
  object.name = reader.readStringOrNull(offsets[7]);
  object.phone = reader.readStringOrNull(offsets[8]);
  object.status = reader.readStringOrNull(offsets[9]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  object.userId = reader.readStringOrNull(offsets[12]);
  return object;
}

P _driverLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _driverLocalGetId(DriverLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _driverLocalGetLinks(DriverLocal object) {
  return [];
}

void _driverLocalAttach(
    IsarCollection<dynamic> col, Id id, DriverLocal object) {
  object.id = id;
}

extension DriverLocalByIndex on IsarCollection<DriverLocal> {
  Future<DriverLocal?> getByDriverId(String driverId) {
    return getByIndex(r'driverId', [driverId]);
  }

  DriverLocal? getByDriverIdSync(String driverId) {
    return getByIndexSync(r'driverId', [driverId]);
  }

  Future<bool> deleteByDriverId(String driverId) {
    return deleteByIndex(r'driverId', [driverId]);
  }

  bool deleteByDriverIdSync(String driverId) {
    return deleteByIndexSync(r'driverId', [driverId]);
  }

  Future<List<DriverLocal?>> getAllByDriverId(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'driverId', values);
  }

  List<DriverLocal?> getAllByDriverIdSync(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'driverId', values);
  }

  Future<int> deleteAllByDriverId(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'driverId', values);
  }

  int deleteAllByDriverIdSync(List<String> driverIdValues) {
    final values = driverIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'driverId', values);
  }

  Future<Id> putByDriverId(DriverLocal object) {
    return putByIndex(r'driverId', object);
  }

  Id putByDriverIdSync(DriverLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'driverId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDriverId(List<DriverLocal> objects) {
    return putAllByIndex(r'driverId', objects);
  }

  List<Id> putAllByDriverIdSync(List<DriverLocal> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'driverId', objects, saveLinks: saveLinks);
  }
}

extension DriverLocalQueryWhereSort
    on QueryBuilder<DriverLocal, DriverLocal, QWhere> {
  QueryBuilder<DriverLocal, DriverLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhere> anyLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'licenseExpiry'),
      );
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhere> anySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncedAt'),
      );
    });
  }
}

extension DriverLocalQueryWhere
    on QueryBuilder<DriverLocal, DriverLocal, QWhereClause> {
  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> driverIdEqualTo(
      String driverId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'driverId',
        value: [driverId],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> driverIdNotEqualTo(
      String driverId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [],
              upper: [driverId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [driverId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [driverId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'driverId',
              lower: [],
              upper: [driverId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'licenseExpiry',
        value: [null],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'licenseExpiry',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryEqualTo(DateTime? licenseExpiry) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'licenseExpiry',
        value: [licenseExpiry],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryNotEqualTo(DateTime? licenseExpiry) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseExpiry',
              lower: [],
              upper: [licenseExpiry],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseExpiry',
              lower: [licenseExpiry],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseExpiry',
              lower: [licenseExpiry],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseExpiry',
              lower: [],
              upper: [licenseExpiry],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryGreaterThan(
    DateTime? licenseExpiry, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'licenseExpiry',
        lower: [licenseExpiry],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryLessThan(
    DateTime? licenseExpiry, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'licenseExpiry',
        lower: [],
        upper: [licenseExpiry],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      licenseExpiryBetween(
    DateTime? lowerLicenseExpiry,
    DateTime? upperLicenseExpiry, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'licenseExpiry',
        lower: [lowerLicenseExpiry],
        includeLower: includeLower,
        upper: [upperLicenseExpiry],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> userIdEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> userIdNotEqualTo(
      String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      currentVehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'currentVehicleId',
        value: [null],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      currentVehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'currentVehicleId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      currentVehicleIdEqualTo(String? currentVehicleId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'currentVehicleId',
        value: [currentVehicleId],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
      currentVehicleIdNotEqualTo(String? currentVehicleId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentVehicleId',
              lower: [],
              upper: [currentVehicleId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentVehicleId',
              lower: [currentVehicleId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentVehicleId',
              lower: [currentVehicleId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentVehicleId',
              lower: [],
              upper: [currentVehicleId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> syncedAtEqualTo(
      DateTime? syncedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'syncedAt',
        value: [syncedAt],
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> syncedAtNotEqualTo(
      DateTime? syncedAt) {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> syncedAtGreaterThan(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> syncedAtLessThan(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterWhereClause> syncedAtBetween(
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

extension DriverLocalQueryFilter
    on QueryBuilder<DriverLocal, DriverLocal, QFilterCondition> {
  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentVehicleId',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentVehicleId',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentVehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentVehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentVehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentVehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentVehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentVehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentVehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentVehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentVehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      currentVehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentVehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'driverCode',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'driverCode',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverCode',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> driverIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> driverIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'driverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'driverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> driverIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'driverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      driverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'driverId',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseExpiryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licenseExpiry',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseExpiryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licenseExpiry',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseExpiryEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseExpiryGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseExpiryLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseExpiry',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseExpiryBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseExpiry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'licenseNumber',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'licenseNumber',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licenseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licenseNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      licenseNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licenseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameEqualTo(
    String? value, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameGreaterThan(
    String? value, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameLessThan(
    String? value, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneEqualTo(
    String? value, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneLessThan(
    String? value, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneStartsWith(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneEndsWith(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> syncedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> syncedAtBetween(
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
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

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension DriverLocalQueryObject
    on QueryBuilder<DriverLocal, DriverLocal, QFilterCondition> {}

extension DriverLocalQueryLinks
    on QueryBuilder<DriverLocal, DriverLocal, QFilterCondition> {}

extension DriverLocalQuerySortBy
    on QueryBuilder<DriverLocal, DriverLocal, QSortBy> {
  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      sortByCurrentVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVehicleId', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      sortByCurrentVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVehicleId', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByDriverCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCode', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByDriverCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCode', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiry', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      sortByLicenseExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiry', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByLicenseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      sortByLicenseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DriverLocalQuerySortThenBy
    on QueryBuilder<DriverLocal, DriverLocal, QSortThenBy> {
  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      thenByCurrentVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVehicleId', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      thenByCurrentVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentVehicleId', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByDriverCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCode', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByDriverCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverCode', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByDriverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByDriverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'driverId', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiry', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      thenByLicenseExpiryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseExpiry', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByLicenseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy>
      thenByLicenseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseNumber', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension DriverLocalQueryWhereDistinct
    on QueryBuilder<DriverLocal, DriverLocal, QDistinct> {
  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByCurrentVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentVehicleId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByDriverCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByDriverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'driverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByLicenseExpiry() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseExpiry');
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByLicenseNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<DriverLocal, DriverLocal, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension DriverLocalQueryProperty
    on QueryBuilder<DriverLocal, DriverLocal, QQueryProperty> {
  QueryBuilder<DriverLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DriverLocal, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations>
      currentVehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentVehicleId');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations> driverCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverCode');
    });
  }

  QueryBuilder<DriverLocal, String, QQueryOperations> driverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'driverId');
    });
  }

  QueryBuilder<DriverLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<DriverLocal, DateTime?, QQueryOperations>
      licenseExpiryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseExpiry');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations> licenseNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseNumber');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<DriverLocal, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<DriverLocal, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<DriverLocal, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
