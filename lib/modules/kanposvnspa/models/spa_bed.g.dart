// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa_bed.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSpaBedCollection on Isar {
  IsarCollection<SpaBed> get spaBeds => this.collection();
}

const SpaBedSchema = CollectionSchema(
  name: r'SpaBed',
  id: -3652774580486249688,
  properties: {
    r'bedId': PropertySchema(
      id: 0,
      name: r'bedId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'room': PropertySchema(
      id: 2,
      name: r'room',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.byte,
      enumMap: _SpaBedstatusEnumValueMap,
    )
  },
  estimateSize: _spaBedEstimateSize,
  serialize: _spaBedSerialize,
  deserialize: _spaBedDeserialize,
  deserializeProp: _spaBedDeserializeProp,
  idName: r'id',
  indexes: {
    r'bedId': IndexSchema(
      id: 8968463358970594975,
      name: r'bedId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'bedId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _spaBedGetId,
  getLinks: _spaBedGetLinks,
  attach: _spaBedAttach,
  version: '3.1.0+1',
);

int _spaBedEstimateSize(
  SpaBed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bedId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.room.length * 3;
  return bytesCount;
}

void _spaBedSerialize(
  SpaBed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bedId);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.room);
  writer.writeByte(offsets[3], object.status.index);
}

SpaBed _spaBedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SpaBed();
  object.bedId = reader.readString(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.room = reader.readString(offsets[2]);
  object.status =
      _SpaBedstatusValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          SpaBedStatus.EMPTY;
  return object;
}

P _spaBedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_SpaBedstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          SpaBedStatus.EMPTY) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SpaBedstatusEnumValueMap = {
  'EMPTY': 0,
  'PLAYING': 1,
  'CLEANING': 2,
};
const _SpaBedstatusValueEnumMap = {
  0: SpaBedStatus.EMPTY,
  1: SpaBedStatus.PLAYING,
  2: SpaBedStatus.CLEANING,
};

Id _spaBedGetId(SpaBed object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _spaBedGetLinks(SpaBed object) {
  return [];
}

void _spaBedAttach(IsarCollection<dynamic> col, Id id, SpaBed object) {
  object.id = id;
}

extension SpaBedByIndex on IsarCollection<SpaBed> {
  Future<SpaBed?> getByBedId(String bedId) {
    return getByIndex(r'bedId', [bedId]);
  }

  SpaBed? getByBedIdSync(String bedId) {
    return getByIndexSync(r'bedId', [bedId]);
  }

  Future<bool> deleteByBedId(String bedId) {
    return deleteByIndex(r'bedId', [bedId]);
  }

  bool deleteByBedIdSync(String bedId) {
    return deleteByIndexSync(r'bedId', [bedId]);
  }

  Future<List<SpaBed?>> getAllByBedId(List<String> bedIdValues) {
    final values = bedIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'bedId', values);
  }

  List<SpaBed?> getAllByBedIdSync(List<String> bedIdValues) {
    final values = bedIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bedId', values);
  }

  Future<int> deleteAllByBedId(List<String> bedIdValues) {
    final values = bedIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bedId', values);
  }

  int deleteAllByBedIdSync(List<String> bedIdValues) {
    final values = bedIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bedId', values);
  }

  Future<Id> putByBedId(SpaBed object) {
    return putByIndex(r'bedId', object);
  }

  Id putByBedIdSync(SpaBed object, {bool saveLinks = true}) {
    return putByIndexSync(r'bedId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBedId(List<SpaBed> objects) {
    return putAllByIndex(r'bedId', objects);
  }

  List<Id> putAllByBedIdSync(List<SpaBed> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'bedId', objects, saveLinks: saveLinks);
  }
}

extension SpaBedQueryWhereSort on QueryBuilder<SpaBed, SpaBed, QWhere> {
  QueryBuilder<SpaBed, SpaBed, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SpaBedQueryWhere on QueryBuilder<SpaBed, SpaBed, QWhereClause> {
  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> idBetween(
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

  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> bedIdEqualTo(String bedId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bedId',
        value: [bedId],
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterWhereClause> bedIdNotEqualTo(
      String bedId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedId',
              lower: [],
              upper: [bedId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedId',
              lower: [bedId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedId',
              lower: [bedId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bedId',
              lower: [],
              upper: [bedId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SpaBedQueryFilter on QueryBuilder<SpaBed, SpaBed, QFilterCondition> {
  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bedId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bedId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bedId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bedId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> bedIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bedId',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'room',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'room',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'room',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'room',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> roomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'room',
        value: '',
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> statusEqualTo(
      SpaBedStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> statusGreaterThan(
    SpaBedStatus value, {
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> statusLessThan(
    SpaBedStatus value, {
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

  QueryBuilder<SpaBed, SpaBed, QAfterFilterCondition> statusBetween(
    SpaBedStatus lower,
    SpaBedStatus upper, {
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
}

extension SpaBedQueryObject on QueryBuilder<SpaBed, SpaBed, QFilterCondition> {}

extension SpaBedQueryLinks on QueryBuilder<SpaBed, SpaBed, QFilterCondition> {}

extension SpaBedQuerySortBy on QueryBuilder<SpaBed, SpaBed, QSortBy> {
  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByBedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedId', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByBedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedId', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByRoom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByRoomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SpaBedQuerySortThenBy on QueryBuilder<SpaBed, SpaBed, QSortThenBy> {
  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByBedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedId', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByBedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bedId', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByRoom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByRoomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'room', Sort.desc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SpaBedQueryWhereDistinct on QueryBuilder<SpaBed, SpaBed, QDistinct> {
  QueryBuilder<SpaBed, SpaBed, QDistinct> distinctByBedId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bedId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QDistinct> distinctByRoom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'room', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SpaBed, SpaBed, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension SpaBedQueryProperty on QueryBuilder<SpaBed, SpaBed, QQueryProperty> {
  QueryBuilder<SpaBed, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SpaBed, String, QQueryOperations> bedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bedId');
    });
  }

  QueryBuilder<SpaBed, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SpaBed, String, QQueryOperations> roomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'room');
    });
  }

  QueryBuilder<SpaBed, SpaBedStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
