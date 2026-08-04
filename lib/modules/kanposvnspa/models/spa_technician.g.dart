// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa_technician.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSpaTechnicianCollection on Isar {
  IsarCollection<SpaTechnician> get spaTechnicians => this.collection();
}

const SpaTechnicianSchema = CollectionSchema(
  name: r'SpaTechnician',
  id: -8285797962708524901,
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
    r'isSynced': PropertySchema(
      id: 2,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 4,
      name: r'phone',
      type: IsarType.string,
    ),
    r'specialized': PropertySchema(
      id: 5,
      name: r'specialized',
      type: IsarType.string,
    ),
    r'techId': PropertySchema(
      id: 6,
      name: r'techId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 8,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _spaTechnicianEstimateSize,
  serialize: _spaTechnicianSerialize,
  deserialize: _spaTechnicianDeserialize,
  deserializeProp: _spaTechnicianDeserializeProp,
  idName: r'id',
  indexes: {
    r'techId': IndexSchema(
      id: -7436770592732720053,
      name: r'techId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'techId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _spaTechnicianGetId,
  getLinks: _spaTechnicianGetLinks,
  attach: _spaTechnicianAttach,
  version: '3.1.0+1',
);

int _spaTechnicianEstimateSize(
  SpaTechnician object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.specialized.length * 3;
  bytesCount += 3 + object.techId.length * 3;
  return bytesCount;
}

void _spaTechnicianSerialize(
  SpaTechnician object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeBool(offsets[2], object.isSynced);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.phone);
  writer.writeString(offsets[5], object.specialized);
  writer.writeString(offsets[6], object.techId);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeLong(offsets[8], object.version);
}

SpaTechnician _spaTechnicianDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SpaTechnician();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.phone = reader.readString(offsets[4]);
  object.specialized = reader.readString(offsets[5]);
  object.techId = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.version = reader.readLong(offsets[8]);
  return object;
}

P _spaTechnicianDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _spaTechnicianGetId(SpaTechnician object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _spaTechnicianGetLinks(SpaTechnician object) {
  return [];
}

void _spaTechnicianAttach(
    IsarCollection<dynamic> col, Id id, SpaTechnician object) {
  object.id = id;
}

extension SpaTechnicianByIndex on IsarCollection<SpaTechnician> {
  Future<SpaTechnician?> getByTechId(String techId) {
    return getByIndex(r'techId', [techId]);
  }

  SpaTechnician? getByTechIdSync(String techId) {
    return getByIndexSync(r'techId', [techId]);
  }

  Future<bool> deleteByTechId(String techId) {
    return deleteByIndex(r'techId', [techId]);
  }

  bool deleteByTechIdSync(String techId) {
    return deleteByIndexSync(r'techId', [techId]);
  }

  Future<List<SpaTechnician?>> getAllByTechId(List<String> techIdValues) {
    final values = techIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'techId', values);
  }

  List<SpaTechnician?> getAllByTechIdSync(List<String> techIdValues) {
    final values = techIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'techId', values);
  }

  Future<int> deleteAllByTechId(List<String> techIdValues) {
    final values = techIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'techId', values);
  }

  int deleteAllByTechIdSync(List<String> techIdValues) {
    final values = techIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'techId', values);
  }

  Future<Id> putByTechId(SpaTechnician object) {
    return putByIndex(r'techId', object);
  }

  Id putByTechIdSync(SpaTechnician object, {bool saveLinks = true}) {
    return putByIndexSync(r'techId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTechId(List<SpaTechnician> objects) {
    return putAllByIndex(r'techId', objects);
  }

  List<Id> putAllByTechIdSync(List<SpaTechnician> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'techId', objects, saveLinks: saveLinks);
  }
}

extension SpaTechnicianQueryWhereSort
    on QueryBuilder<SpaTechnician, SpaTechnician, QWhere> {
  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SpaTechnicianQueryWhere
    on QueryBuilder<SpaTechnician, SpaTechnician, QWhereClause> {
  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause> idBetween(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause> techIdEqualTo(
      String techId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'techId',
        value: [techId],
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterWhereClause>
      techIdNotEqualTo(String techId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'techId',
              lower: [],
              upper: [techId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'techId',
              lower: [techId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'techId',
              lower: [techId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'techId',
              lower: [],
              upper: [techId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SpaTechnicianQueryFilter
    on QueryBuilder<SpaTechnician, SpaTechnician, QFilterCondition> {
  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'specialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'specialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'specialized',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'specialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'specialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'specialized',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'specialized',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialized',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      specializedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'specialized',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'techId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'techId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'techId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'techId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'techId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'techId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'techId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'techId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'techId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      techIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'techId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterFilterCondition>
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

extension SpaTechnicianQueryObject
    on QueryBuilder<SpaTechnician, SpaTechnician, QFilterCondition> {}

extension SpaTechnicianQueryLinks
    on QueryBuilder<SpaTechnician, SpaTechnician, QFilterCondition> {}

extension SpaTechnicianQuerySortBy
    on QueryBuilder<SpaTechnician, SpaTechnician, QSortBy> {
  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortBySpecialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialized', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      sortBySpecializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialized', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByTechId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techId', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByTechIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techId', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension SpaTechnicianQuerySortThenBy
    on QueryBuilder<SpaTechnician, SpaTechnician, QSortThenBy> {
  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenBySpecialized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialized', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      thenBySpecializedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialized', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByTechId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techId', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByTechIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'techId', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension SpaTechnicianQueryWhereDistinct
    on QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> {
  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctBySpecialized(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'specialized', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByTechId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'techId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SpaTechnician, SpaTechnician, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension SpaTechnicianQueryProperty
    on QueryBuilder<SpaTechnician, SpaTechnician, QQueryProperty> {
  QueryBuilder<SpaTechnician, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SpaTechnician, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<SpaTechnician, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<SpaTechnician, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<SpaTechnician, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SpaTechnician, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<SpaTechnician, String, QQueryOperations> specializedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'specialized');
    });
  }

  QueryBuilder<SpaTechnician, String, QQueryOperations> techIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'techId');
    });
  }

  QueryBuilder<SpaTechnician, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SpaTechnician, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
