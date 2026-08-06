// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCrmLicenseCollection on Isar {
  IsarCollection<CrmLicense> get crmLicenses => this.collection();
}

const CrmLicenseSchema = CollectionSchema(
  name: r'CrmLicense',
  id: 1598465153853841376,
  properties: {
    r'activatedAt': PropertySchema(
      id: 0,
      name: r'activatedAt',
      type: IsarType.dateTime,
    ),
    r'appCode': PropertySchema(
      id: 1,
      name: r'appCode',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'customerId': PropertySchema(
      id: 3,
      name: r'customerId',
      type: IsarType.string,
    ),
    r'deletedAt': PropertySchema(
      id: 4,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'expiresAt': PropertySchema(
      id: 5,
      name: r'expiresAt',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 6,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'licenseId': PropertySchema(
      id: 7,
      name: r'licenseId',
      type: IsarType.string,
    ),
    r'licenseKey': PropertySchema(
      id: 8,
      name: r'licenseKey',
      type: IsarType.string,
    ),
    r'maxDevices': PropertySchema(
      id: 9,
      name: r'maxDevices',
      type: IsarType.long,
    ),
    r'packageType': PropertySchema(
      id: 10,
      name: r'packageType',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
    ),
    r'storeId': PropertySchema(
      id: 12,
      name: r'storeId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _crmLicenseEstimateSize,
  serialize: _crmLicenseSerialize,
  deserialize: _crmLicenseDeserialize,
  deserializeProp: _crmLicenseDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'licenseId': IndexSchema(
      id: 2024518247436909527,
      name: r'licenseId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'licenseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _crmLicenseGetId,
  getLinks: _crmLicenseGetLinks,
  attach: _crmLicenseAttach,
  version: '3.1.0+1',
);

int _crmLicenseEstimateSize(
  CrmLicense object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.appCode.length * 3;
  bytesCount += 3 + object.customerId.length * 3;
  bytesCount += 3 + object.licenseId.length * 3;
  bytesCount += 3 + object.licenseKey.length * 3;
  bytesCount += 3 + object.packageType.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.storeId.length * 3;
  return bytesCount;
}

void _crmLicenseSerialize(
  CrmLicense object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.activatedAt);
  writer.writeString(offsets[1], object.appCode);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.customerId);
  writer.writeDateTime(offsets[4], object.deletedAt);
  writer.writeDateTime(offsets[5], object.expiresAt);
  writer.writeBool(offsets[6], object.isSynced);
  writer.writeString(offsets[7], object.licenseId);
  writer.writeString(offsets[8], object.licenseKey);
  writer.writeLong(offsets[9], object.maxDevices);
  writer.writeString(offsets[10], object.packageType);
  writer.writeString(offsets[11], object.status);
  writer.writeString(offsets[12], object.storeId);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

CrmLicense _crmLicenseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrmLicense();
  object.activatedAt = reader.readDateTimeOrNull(offsets[0]);
  object.appCode = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.customerId = reader.readString(offsets[3]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[4]);
  object.expiresAt = reader.readDateTimeOrNull(offsets[5]);
  object.isSynced = reader.readBool(offsets[6]);
  object.isarId = id;
  object.licenseId = reader.readString(offsets[7]);
  object.licenseKey = reader.readString(offsets[8]);
  object.maxDevices = reader.readLong(offsets[9]);
  object.packageType = reader.readString(offsets[10]);
  object.status = reader.readString(offsets[11]);
  object.storeId = reader.readString(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  return object;
}

P _crmLicenseDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _crmLicenseGetId(CrmLicense object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _crmLicenseGetLinks(CrmLicense object) {
  return [];
}

void _crmLicenseAttach(IsarCollection<dynamic> col, Id id, CrmLicense object) {
  object.isarId = id;
}

extension CrmLicenseByIndex on IsarCollection<CrmLicense> {
  Future<CrmLicense?> getByLicenseId(String licenseId) {
    return getByIndex(r'licenseId', [licenseId]);
  }

  CrmLicense? getByLicenseIdSync(String licenseId) {
    return getByIndexSync(r'licenseId', [licenseId]);
  }

  Future<bool> deleteByLicenseId(String licenseId) {
    return deleteByIndex(r'licenseId', [licenseId]);
  }

  bool deleteByLicenseIdSync(String licenseId) {
    return deleteByIndexSync(r'licenseId', [licenseId]);
  }

  Future<List<CrmLicense?>> getAllByLicenseId(List<String> licenseIdValues) {
    final values = licenseIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'licenseId', values);
  }

  List<CrmLicense?> getAllByLicenseIdSync(List<String> licenseIdValues) {
    final values = licenseIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'licenseId', values);
  }

  Future<int> deleteAllByLicenseId(List<String> licenseIdValues) {
    final values = licenseIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'licenseId', values);
  }

  int deleteAllByLicenseIdSync(List<String> licenseIdValues) {
    final values = licenseIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'licenseId', values);
  }

  Future<Id> putByLicenseId(CrmLicense object) {
    return putByIndex(r'licenseId', object);
  }

  Id putByLicenseIdSync(CrmLicense object, {bool saveLinks = true}) {
    return putByIndexSync(r'licenseId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLicenseId(List<CrmLicense> objects) {
    return putAllByIndex(r'licenseId', objects);
  }

  List<Id> putAllByLicenseIdSync(List<CrmLicense> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'licenseId', objects, saveLinks: saveLinks);
  }
}

extension CrmLicenseQueryWhereSort
    on QueryBuilder<CrmLicense, CrmLicense, QWhere> {
  QueryBuilder<CrmLicense, CrmLicense, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CrmLicenseQueryWhere
    on QueryBuilder<CrmLicense, CrmLicense, QWhereClause> {
  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> isarIdNotEqualTo(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> licenseIdEqualTo(
      String licenseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'licenseId',
        value: [licenseId],
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterWhereClause> licenseIdNotEqualTo(
      String licenseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseId',
              lower: [],
              upper: [licenseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseId',
              lower: [licenseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseId',
              lower: [licenseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'licenseId',
              lower: [],
              upper: [licenseId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CrmLicenseQueryFilter
    on QueryBuilder<CrmLicense, CrmLicense, QFilterCondition> {
  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      activatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'activatedAt',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      activatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'activatedAt',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      activatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      activatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      activatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      activatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      appCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> appCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      appCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appCode',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> customerIdEqualTo(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> customerIdBetween(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      customerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> customerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      customerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      customerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      expiresAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiresAt',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      expiresAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiresAt',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> expiresAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      expiresAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> expiresAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiresAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> expiresAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiresAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licenseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licenseKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licenseKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licenseKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licenseKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licenseKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licenseKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> licenseKeyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licenseKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licenseKey',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      licenseKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licenseKey',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> maxDevicesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxDevices',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      maxDevicesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxDevices',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      maxDevicesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxDevices',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> maxDevicesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxDevices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageType',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      packageTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageType',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusContains(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusMatches(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      storeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> storeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
      storeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition>
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<CrmLicense, CrmLicense, QAfterFilterCondition> updatedAtBetween(
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
}

extension CrmLicenseQueryObject
    on QueryBuilder<CrmLicense, CrmLicense, QFilterCondition> {}

extension CrmLicenseQueryLinks
    on QueryBuilder<CrmLicense, CrmLicense, QFilterCondition> {}

extension CrmLicenseQuerySortBy
    on QueryBuilder<CrmLicense, CrmLicense, QSortBy> {
  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByActivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByAppCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByAppCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByLicenseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByLicenseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByLicenseKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseKey', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByLicenseKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseKey', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByMaxDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDevices', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByMaxDevicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDevices', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByPackageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageType', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByPackageTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageType', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CrmLicenseQuerySortThenBy
    on QueryBuilder<CrmLicense, CrmLicense, QSortThenBy> {
  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByActivatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activatedAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByAppCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByAppCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appCode', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByExpiresAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiresAt', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByLicenseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByLicenseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByLicenseKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseKey', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByLicenseKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licenseKey', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByMaxDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDevices', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByMaxDevicesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxDevices', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByPackageType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageType', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByPackageTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageType', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CrmLicenseQueryWhereDistinct
    on QueryBuilder<CrmLicense, CrmLicense, QDistinct> {
  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByActivatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activatedAt');
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByAppCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByCustomerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByExpiresAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiresAt');
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByLicenseId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByLicenseKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licenseKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByMaxDevices() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxDevices');
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByPackageType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByStoreId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmLicense, CrmLicense, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension CrmLicenseQueryProperty
    on QueryBuilder<CrmLicense, CrmLicense, QQueryProperty> {
  QueryBuilder<CrmLicense, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CrmLicense, DateTime?, QQueryOperations> activatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activatedAt');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> appCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appCode');
    });
  }

  QueryBuilder<CrmLicense, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<CrmLicense, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CrmLicense, DateTime?, QQueryOperations> expiresAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiresAt');
    });
  }

  QueryBuilder<CrmLicense, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> licenseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseId');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> licenseKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licenseKey');
    });
  }

  QueryBuilder<CrmLicense, int, QQueryOperations> maxDevicesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxDevices');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> packageTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageType');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<CrmLicense, String, QQueryOperations> storeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeId');
    });
  }

  QueryBuilder<CrmLicense, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCrmSubscriptionCollection on Isar {
  IsarCollection<CrmSubscription> get crmSubscriptions => this.collection();
}

const CrmSubscriptionSchema = CollectionSchema(
  name: r'CrmSubscription',
  id: -4635489202424530329,
  properties: {
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'features': PropertySchema(
      id: 1,
      name: r'features',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 2,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'maxStores': PropertySchema(
      id: 3,
      name: r'maxStores',
      type: IsarType.long,
    ),
    r'maxUsers': PropertySchema(
      id: 4,
      name: r'maxUsers',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'pricePerMonth': PropertySchema(
      id: 6,
      name: r'pricePerMonth',
      type: IsarType.double,
    ),
    r'pricePerYear': PropertySchema(
      id: 7,
      name: r'pricePerYear',
      type: IsarType.double,
    ),
    r'subscriptionId': PropertySchema(
      id: 8,
      name: r'subscriptionId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _crmSubscriptionEstimateSize,
  serialize: _crmSubscriptionSerialize,
  deserialize: _crmSubscriptionDeserialize,
  deserializeProp: _crmSubscriptionDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'subscriptionId': IndexSchema(
      id: -2440251475652077983,
      name: r'subscriptionId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'subscriptionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _crmSubscriptionGetId,
  getLinks: _crmSubscriptionGetLinks,
  attach: _crmSubscriptionAttach,
  version: '3.1.0+1',
);

int _crmSubscriptionEstimateSize(
  CrmSubscription object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.features.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.subscriptionId.length * 3;
  return bytesCount;
}

void _crmSubscriptionSerialize(
  CrmSubscription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.features);
  writer.writeBool(offsets[2], object.isSynced);
  writer.writeLong(offsets[3], object.maxStores);
  writer.writeLong(offsets[4], object.maxUsers);
  writer.writeString(offsets[5], object.name);
  writer.writeDouble(offsets[6], object.pricePerMonth);
  writer.writeDouble(offsets[7], object.pricePerYear);
  writer.writeString(offsets[8], object.subscriptionId);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

CrmSubscription _crmSubscriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CrmSubscription();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.features = reader.readString(offsets[1]);
  object.isSynced = reader.readBool(offsets[2]);
  object.isarId = id;
  object.maxStores = reader.readLong(offsets[3]);
  object.maxUsers = reader.readLong(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.pricePerMonth = reader.readDouble(offsets[6]);
  object.pricePerYear = reader.readDouble(offsets[7]);
  object.subscriptionId = reader.readString(offsets[8]);
  object.updatedAt = reader.readDateTime(offsets[9]);
  return object;
}

P _crmSubscriptionDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _crmSubscriptionGetId(CrmSubscription object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _crmSubscriptionGetLinks(CrmSubscription object) {
  return [];
}

void _crmSubscriptionAttach(
    IsarCollection<dynamic> col, Id id, CrmSubscription object) {
  object.isarId = id;
}

extension CrmSubscriptionByIndex on IsarCollection<CrmSubscription> {
  Future<CrmSubscription?> getBySubscriptionId(String subscriptionId) {
    return getByIndex(r'subscriptionId', [subscriptionId]);
  }

  CrmSubscription? getBySubscriptionIdSync(String subscriptionId) {
    return getByIndexSync(r'subscriptionId', [subscriptionId]);
  }

  Future<bool> deleteBySubscriptionId(String subscriptionId) {
    return deleteByIndex(r'subscriptionId', [subscriptionId]);
  }

  bool deleteBySubscriptionIdSync(String subscriptionId) {
    return deleteByIndexSync(r'subscriptionId', [subscriptionId]);
  }

  Future<List<CrmSubscription?>> getAllBySubscriptionId(
      List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'subscriptionId', values);
  }

  List<CrmSubscription?> getAllBySubscriptionIdSync(
      List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'subscriptionId', values);
  }

  Future<int> deleteAllBySubscriptionId(List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'subscriptionId', values);
  }

  int deleteAllBySubscriptionIdSync(List<String> subscriptionIdValues) {
    final values = subscriptionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'subscriptionId', values);
  }

  Future<Id> putBySubscriptionId(CrmSubscription object) {
    return putByIndex(r'subscriptionId', object);
  }

  Id putBySubscriptionIdSync(CrmSubscription object, {bool saveLinks = true}) {
    return putByIndexSync(r'subscriptionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySubscriptionId(List<CrmSubscription> objects) {
    return putAllByIndex(r'subscriptionId', objects);
  }

  List<Id> putAllBySubscriptionIdSync(List<CrmSubscription> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'subscriptionId', objects, saveLinks: saveLinks);
  }
}

extension CrmSubscriptionQueryWhereSort
    on QueryBuilder<CrmSubscription, CrmSubscription, QWhere> {
  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CrmSubscriptionQueryWhere
    on QueryBuilder<CrmSubscription, CrmSubscription, QWhereClause> {
  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
      isarIdBetween(
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
      subscriptionIdEqualTo(String subscriptionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'subscriptionId',
        value: [subscriptionId],
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterWhereClause>
      subscriptionIdNotEqualTo(String subscriptionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [],
              upper: [subscriptionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [subscriptionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [subscriptionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'subscriptionId',
              lower: [],
              upper: [subscriptionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CrmSubscriptionQueryFilter
    on QueryBuilder<CrmSubscription, CrmSubscription, QFilterCondition> {
  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'features',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'features',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'features',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'features',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'features',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'features',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'features',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'features',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'features',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      featuresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'features',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxStoresEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxStores',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxStoresGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxStores',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxStoresLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxStores',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxStoresBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxStores',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxUsersEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxUsers',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxUsersGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxUsers',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxUsersLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxUsers',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      maxUsersBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxUsers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerMonthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerMonth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerMonthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerMonth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerMonthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerMonth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerMonthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerMonth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerYearEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerYear',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerYearGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerYear',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerYearLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerYear',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      pricePerYearBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerYear',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subscriptionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subscriptionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subscriptionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subscriptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      subscriptionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subscriptionId',
        value: '',
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterFilterCondition>
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
}

extension CrmSubscriptionQueryObject
    on QueryBuilder<CrmSubscription, CrmSubscription, QFilterCondition> {}

extension CrmSubscriptionQueryLinks
    on QueryBuilder<CrmSubscription, CrmSubscription, QFilterCondition> {}

extension CrmSubscriptionQuerySortBy
    on QueryBuilder<CrmSubscription, CrmSubscription, QSortBy> {
  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByFeatures() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'features', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByFeaturesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'features', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByMaxStores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStores', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByMaxStoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStores', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByMaxUsers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxUsers', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByMaxUsersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxUsers', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByPricePerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMonth', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByPricePerMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMonth', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByPricePerYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerYear', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByPricePerYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerYear', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortBySubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CrmSubscriptionQuerySortThenBy
    on QueryBuilder<CrmSubscription, CrmSubscription, QSortThenBy> {
  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByFeatures() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'features', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByFeaturesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'features', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByMaxStores() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStores', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByMaxStoresDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxStores', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByMaxUsers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxUsers', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByMaxUsersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxUsers', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByPricePerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMonth', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByPricePerMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerMonth', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByPricePerYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerYear', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByPricePerYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerYear', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenBySubscriptionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenBySubscriptionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subscriptionId', Sort.desc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CrmSubscriptionQueryWhereDistinct
    on QueryBuilder<CrmSubscription, CrmSubscription, QDistinct> {
  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct> distinctByFeatures(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'features', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByMaxStores() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxStores');
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByMaxUsers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxUsers');
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByPricePerMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerMonth');
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByPricePerYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerYear');
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctBySubscriptionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subscriptionId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CrmSubscription, CrmSubscription, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension CrmSubscriptionQueryProperty
    on QueryBuilder<CrmSubscription, CrmSubscription, QQueryProperty> {
  QueryBuilder<CrmSubscription, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<CrmSubscription, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<CrmSubscription, String, QQueryOperations> featuresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'features');
    });
  }

  QueryBuilder<CrmSubscription, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<CrmSubscription, int, QQueryOperations> maxStoresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxStores');
    });
  }

  QueryBuilder<CrmSubscription, int, QQueryOperations> maxUsersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxUsers');
    });
  }

  QueryBuilder<CrmSubscription, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CrmSubscription, double, QQueryOperations>
      pricePerMonthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerMonth');
    });
  }

  QueryBuilder<CrmSubscription, double, QQueryOperations>
      pricePerYearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerYear');
    });
  }

  QueryBuilder<CrmSubscription, String, QQueryOperations>
      subscriptionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subscriptionId');
    });
  }

  QueryBuilder<CrmSubscription, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
