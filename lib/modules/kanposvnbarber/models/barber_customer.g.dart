// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber_customer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBarberCustomerCollection on Isar {
  IsarCollection<BarberCustomer> get barberCustomers => this.collection();
}

const BarberCustomerSchema = CollectionSchema(
  name: r'BarberCustomer',
  id: 4062001777873686910,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'afterImages': PropertySchema(
      id: 1,
      name: r'afterImages',
      type: IsarType.stringList,
    ),
    r'avatar': PropertySchema(
      id: 2,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'beforeImages': PropertySchema(
      id: 3,
      name: r'beforeImages',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 5,
      name: r'customerId',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 6,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 7,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'dob': PropertySchema(
      id: 8,
      name: r'dob',
      type: IsarType.dateTime,
    ),
    r'email': PropertySchema(
      id: 9,
      name: r'email',
      type: IsarType.string,
    ),
    r'facebook': PropertySchema(
      id: 10,
      name: r'facebook',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 11,
      name: r'gender',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 12,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastVisit': PropertySchema(
      id: 13,
      name: r'lastVisit',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 14,
      name: r'name',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 15,
      name: r'notes',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 16,
      name: r'phone',
      type: IsarType.string,
    ),
    r'previousHairColors': PropertySchema(
      id: 17,
      name: r'previousHairColors',
      type: IsarType.stringList,
    ),
    r'previousHairStyles': PropertySchema(
      id: 18,
      name: r'previousHairStyles',
      type: IsarType.stringList,
    ),
    r'rewardPoints': PropertySchema(
      id: 19,
      name: r'rewardPoints',
      type: IsarType.long,
    ),
    r'totalSpent': PropertySchema(
      id: 20,
      name: r'totalSpent',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 21,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'usedServices': PropertySchema(
      id: 22,
      name: r'usedServices',
      type: IsarType.stringList,
    ),
    r'version': PropertySchema(
      id: 23,
      name: r'version',
      type: IsarType.long,
    ),
    r'zalo': PropertySchema(
      id: 24,
      name: r'zalo',
      type: IsarType.string,
    )
  },
  estimateSize: _barberCustomerEstimateSize,
  serialize: _barberCustomerSerialize,
  deserialize: _barberCustomerDeserialize,
  deserializeProp: _barberCustomerDeserializeProp,
  idName: r'id',
  indexes: {
    r'customerId': IndexSchema(
      id: 1498639901530368639,
      name: r'customerId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'customerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _barberCustomerGetId,
  getLinks: _barberCustomerGetLinks,
  attach: _barberCustomerAttach,
  version: '3.1.0+1',
);

int _barberCustomerEstimateSize(
  BarberCustomer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.afterImages.length * 3;
  {
    for (var i = 0; i < object.afterImages.length; i++) {
      final value = object.afterImages[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.avatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.beforeImages.length * 3;
  {
    for (var i = 0; i < object.beforeImages.length; i++) {
      final value = object.beforeImages[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.customerId.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.facebook;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.previousHairColors.length * 3;
  {
    for (var i = 0; i < object.previousHairColors.length; i++) {
      final value = object.previousHairColors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.previousHairStyles.length * 3;
  {
    for (var i = 0; i < object.previousHairStyles.length; i++) {
      final value = object.previousHairStyles[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.usedServices.length * 3;
  {
    for (var i = 0; i < object.usedServices.length; i++) {
      final value = object.usedServices[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.zalo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _barberCustomerSerialize(
  BarberCustomer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeStringList(offsets[1], object.afterImages);
  writer.writeString(offsets[2], object.avatar);
  writer.writeStringList(offsets[3], object.beforeImages);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.customerId);
  writer.writeDateTime(offsets[6], object.deletedAt);
  writer.writeString(offsets[7], object.deviceId);
  writer.writeDateTime(offsets[8], object.dob);
  writer.writeString(offsets[9], object.email);
  writer.writeString(offsets[10], object.facebook);
  writer.writeString(offsets[11], object.gender);
  writer.writeBool(offsets[12], object.isSynced);
  writer.writeDateTime(offsets[13], object.lastVisit);
  writer.writeString(offsets[14], object.name);
  writer.writeString(offsets[15], object.notes);
  writer.writeString(offsets[16], object.phone);
  writer.writeStringList(offsets[17], object.previousHairColors);
  writer.writeStringList(offsets[18], object.previousHairStyles);
  writer.writeLong(offsets[19], object.rewardPoints);
  writer.writeDouble(offsets[20], object.totalSpent);
  writer.writeDateTime(offsets[21], object.updatedAt);
  writer.writeStringList(offsets[22], object.usedServices);
  writer.writeLong(offsets[23], object.version);
  writer.writeString(offsets[24], object.zalo);
}

BarberCustomer _barberCustomerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BarberCustomer();
  object.address = reader.readStringOrNull(offsets[0]);
  object.afterImages = reader.readStringList(offsets[1]) ?? [];
  object.avatar = reader.readStringOrNull(offsets[2]);
  object.beforeImages = reader.readStringList(offsets[3]) ?? [];
  object.createdAt = reader.readDateTime(offsets[4]);
  object.customerId = reader.readString(offsets[5]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[6]);
  object.deviceId = reader.readString(offsets[7]);
  object.dob = reader.readDateTimeOrNull(offsets[8]);
  object.email = reader.readStringOrNull(offsets[9]);
  object.facebook = reader.readStringOrNull(offsets[10]);
  object.gender = reader.readStringOrNull(offsets[11]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[12]);
  object.lastVisit = reader.readDateTimeOrNull(offsets[13]);
  object.name = reader.readString(offsets[14]);
  object.notes = reader.readStringOrNull(offsets[15]);
  object.phone = reader.readString(offsets[16]);
  object.previousHairColors = reader.readStringList(offsets[17]) ?? [];
  object.previousHairStyles = reader.readStringList(offsets[18]) ?? [];
  object.rewardPoints = reader.readLong(offsets[19]);
  object.totalSpent = reader.readDouble(offsets[20]);
  object.updatedAt = reader.readDateTime(offsets[21]);
  object.usedServices = reader.readStringList(offsets[22]) ?? [];
  object.version = reader.readLong(offsets[23]);
  object.zalo = reader.readStringOrNull(offsets[24]);
  return object;
}

P _barberCustomerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringList(offset) ?? []) as P;
    case 18:
      return (reader.readStringList(offset) ?? []) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    case 22:
      return (reader.readStringList(offset) ?? []) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _barberCustomerGetId(BarberCustomer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _barberCustomerGetLinks(BarberCustomer object) {
  return [];
}

void _barberCustomerAttach(
    IsarCollection<dynamic> col, Id id, BarberCustomer object) {
  object.id = id;
}

extension BarberCustomerByIndex on IsarCollection<BarberCustomer> {
  Future<BarberCustomer?> getByCustomerId(String customerId) {
    return getByIndex(r'customerId', [customerId]);
  }

  BarberCustomer? getByCustomerIdSync(String customerId) {
    return getByIndexSync(r'customerId', [customerId]);
  }

  Future<bool> deleteByCustomerId(String customerId) {
    return deleteByIndex(r'customerId', [customerId]);
  }

  bool deleteByCustomerIdSync(String customerId) {
    return deleteByIndexSync(r'customerId', [customerId]);
  }

  Future<List<BarberCustomer?>> getAllByCustomerId(
      List<String> customerIdValues) {
    final values = customerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'customerId', values);
  }

  List<BarberCustomer?> getAllByCustomerIdSync(List<String> customerIdValues) {
    final values = customerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'customerId', values);
  }

  Future<int> deleteAllByCustomerId(List<String> customerIdValues) {
    final values = customerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'customerId', values);
  }

  int deleteAllByCustomerIdSync(List<String> customerIdValues) {
    final values = customerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'customerId', values);
  }

  Future<Id> putByCustomerId(BarberCustomer object) {
    return putByIndex(r'customerId', object);
  }

  Id putByCustomerIdSync(BarberCustomer object, {bool saveLinks = true}) {
    return putByIndexSync(r'customerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCustomerId(List<BarberCustomer> objects) {
    return putAllByIndex(r'customerId', objects);
  }

  List<Id> putAllByCustomerIdSync(List<BarberCustomer> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'customerId', objects, saveLinks: saveLinks);
  }
}

extension BarberCustomerQueryWhereSort
    on QueryBuilder<BarberCustomer, BarberCustomer, QWhere> {
  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension BarberCustomerQueryWhere
    on QueryBuilder<BarberCustomer, BarberCustomer, QWhereClause> {
  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause> idBetween(
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      customerIdEqualTo(String customerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'customerId',
        value: [customerId],
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      customerIdNotEqualTo(String customerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [],
              upper: [customerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [customerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [customerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'customerId',
              lower: [],
              upper: [customerId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BarberCustomerQueryFilter
    on QueryBuilder<BarberCustomer, BarberCustomer, QFilterCondition> {
  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'afterImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'afterImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'afterImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'afterImages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'afterImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'afterImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'afterImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'afterImages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'afterImages',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'afterImages',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'afterImages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'afterImages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'afterImages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'afterImages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'afterImages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      afterImagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'afterImages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beforeImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'beforeImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'beforeImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'beforeImages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'beforeImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'beforeImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'beforeImages',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'beforeImages',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'beforeImages',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'beforeImages',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'beforeImages',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'beforeImages',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'beforeImages',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'beforeImages',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'beforeImages',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      beforeImagesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'beforeImages',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      customerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      dobIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dob',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      dobIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dob',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      dobEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dob',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      dobGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dob',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      dobLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dob',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      dobBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dob',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'facebook',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'facebook',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facebook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facebook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facebook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facebook',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'facebook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'facebook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'facebook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'facebook',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facebook',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      facebookIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'facebook',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      lastVisitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastVisit',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      lastVisitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastVisit',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      lastVisitEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastVisit',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      lastVisitGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastVisit',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      lastVisitLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastVisit',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      lastVisitBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastVisit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesLessThan(
    String? value, {
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousHairColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previousHairColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previousHairColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previousHairColors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previousHairColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previousHairColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previousHairColors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previousHairColors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousHairColors',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previousHairColors',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairColors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairColors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairColors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairColors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairColors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairColorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairColors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousHairStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previousHairStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previousHairStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previousHairStyles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previousHairStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previousHairStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previousHairStyles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previousHairStyles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousHairStyles',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previousHairStyles',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairStyles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairStyles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairStyles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairStyles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairStyles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      previousHairStylesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'previousHairStyles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      rewardPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rewardPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      rewardPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rewardPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      rewardPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rewardPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      rewardPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rewardPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      totalSpentEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalSpent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      totalSpentGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalSpent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      totalSpentLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalSpent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      totalSpentBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalSpent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedServices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usedServices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usedServices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usedServices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usedServices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usedServices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usedServices',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usedServices',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usedServices',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usedServices',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedServices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedServices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedServices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedServices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedServices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      usedServicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'usedServices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
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

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'zalo',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'zalo',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zalo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zalo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zalo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zalo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zalo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zalo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zalo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zalo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zalo',
        value: '',
      ));
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterFilterCondition>
      zaloIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'zalo',
        value: '',
      ));
    });
  }
}

extension BarberCustomerQueryObject
    on QueryBuilder<BarberCustomer, BarberCustomer, QFilterCondition> {}

extension BarberCustomerQueryLinks
    on QueryBuilder<BarberCustomer, BarberCustomer, QFilterCondition> {}

extension BarberCustomerQuerySortBy
    on QueryBuilder<BarberCustomer, BarberCustomer, QSortBy> {
  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByDob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByDobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByFacebook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebook', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByFacebookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebook', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByLastVisit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByLastVisitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByRewardPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByRewardPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByTotalSpent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpent', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByTotalSpentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpent', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByZalo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zalo', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> sortByZaloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zalo', Sort.desc);
    });
  }
}

extension BarberCustomerQuerySortThenBy
    on QueryBuilder<BarberCustomer, BarberCustomer, QSortThenBy> {
  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByDob() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByDobDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dob', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByFacebook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebook', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByFacebookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facebook', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByLastVisit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByLastVisitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByRewardPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByRewardPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByTotalSpent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpent', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByTotalSpentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSpent', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy>
      thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByZalo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zalo', Sort.asc);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QAfterSortBy> thenByZaloDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zalo', Sort.desc);
    });
  }
}

extension BarberCustomerQueryWhereDistinct
    on QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> {
  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByAfterImages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'afterImages');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByBeforeImages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beforeImages');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByCustomerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByDob() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dob');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByFacebook(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facebook', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByLastVisit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastVisit');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByPreviousHairColors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previousHairColors');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByPreviousHairStyles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previousHairStyles');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByRewardPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rewardPoints');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByTotalSpent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSpent');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct>
      distinctByUsedServices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usedServices');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<BarberCustomer, BarberCustomer, QDistinct> distinctByZalo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zalo', caseSensitive: caseSensitive);
    });
  }
}

extension BarberCustomerQueryProperty
    on QueryBuilder<BarberCustomer, BarberCustomer, QQueryProperty> {
  QueryBuilder<BarberCustomer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<BarberCustomer, List<String>, QQueryOperations>
      afterImagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'afterImages');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<BarberCustomer, List<String>, QQueryOperations>
      beforeImagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beforeImages');
    });
  }

  QueryBuilder<BarberCustomer, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BarberCustomer, String, QQueryOperations> customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<BarberCustomer, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<BarberCustomer, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<BarberCustomer, DateTime?, QQueryOperations> dobProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dob');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> facebookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facebook');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<BarberCustomer, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<BarberCustomer, DateTime?, QQueryOperations>
      lastVisitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastVisit');
    });
  }

  QueryBuilder<BarberCustomer, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<BarberCustomer, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<BarberCustomer, List<String>, QQueryOperations>
      previousHairColorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previousHairColors');
    });
  }

  QueryBuilder<BarberCustomer, List<String>, QQueryOperations>
      previousHairStylesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previousHairStyles');
    });
  }

  QueryBuilder<BarberCustomer, int, QQueryOperations> rewardPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rewardPoints');
    });
  }

  QueryBuilder<BarberCustomer, double, QQueryOperations> totalSpentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSpent');
    });
  }

  QueryBuilder<BarberCustomer, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BarberCustomer, List<String>, QQueryOperations>
      usedServicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usedServices');
    });
  }

  QueryBuilder<BarberCustomer, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<BarberCustomer, String?, QQueryOperations> zaloProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zalo');
    });
  }
}
