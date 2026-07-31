// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bida_table.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBidaTableCollection on Isar {
  IsarCollection<BidaTable> get bidaTables => this.collection();
}

const BidaTableSchema = CollectionSchema(
  name: r'BidaTable',
  id: 4832202588143935937,
  properties: {
    r'hourlyPrice': PropertySchema(
      id: 0,
      name: r'hourlyPrice',
      type: IsarType.double,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BidaTablestatusEnumValueMap,
    ),
    r'tableId': PropertySchema(
      id: 3,
      name: r'tableId',
      type: IsarType.string,
    ),
    r'timeBlock': PropertySchema(
      id: 4,
      name: r'timeBlock',
      type: IsarType.byte,
      enumMap: _BidaTabletimeBlockEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BidaTabletypeEnumValueMap,
    )
  },
  estimateSize: _bidaTableEstimateSize,
  serialize: _bidaTableSerialize,
  deserialize: _bidaTableDeserialize,
  deserializeProp: _bidaTableDeserializeProp,
  idName: r'id',
  indexes: {
    r'tableId': IndexSchema(
      id: 519297262500120396,
      name: r'tableId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tableId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bidaTableGetId,
  getLinks: _bidaTableGetLinks,
  attach: _bidaTableAttach,
  version: '3.1.0+1',
);

int _bidaTableEstimateSize(
  BidaTable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tableId.length * 3;
  return bytesCount;
}

void _bidaTableSerialize(
  BidaTable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.hourlyPrice);
  writer.writeString(offsets[1], object.name);
  writer.writeByte(offsets[2], object.status.index);
  writer.writeString(offsets[3], object.tableId);
  writer.writeByte(offsets[4], object.timeBlock.index);
  writer.writeByte(offsets[5], object.type.index);
}

BidaTable _bidaTableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaTable();
  object.hourlyPrice = reader.readDouble(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.status =
      _BidaTablestatusValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          BidaTableStatus.EMPTY;
  object.tableId = reader.readString(offsets[3]);
  object.timeBlock =
      _BidaTabletimeBlockValueEnumMap[reader.readByteOrNull(offsets[4])] ??
          BidaTimeBlock.MINUTE_1;
  object.type = _BidaTabletypeValueEnumMap[reader.readByteOrNull(offsets[5])] ??
      BidaTableType.LO;
  return object;
}

P _bidaTableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_BidaTablestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaTableStatus.EMPTY) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_BidaTabletimeBlockValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaTimeBlock.MINUTE_1) as P;
    case 5:
      return (_BidaTabletypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaTableType.LO) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BidaTablestatusEnumValueMap = {
  'EMPTY': 0,
  'PLAYING': 1,
  'RESERVED': 2,
  'MAINTENANCE': 3,
};
const _BidaTablestatusValueEnumMap = {
  0: BidaTableStatus.EMPTY,
  1: BidaTableStatus.PLAYING,
  2: BidaTableStatus.RESERVED,
  3: BidaTableStatus.MAINTENANCE,
};
const _BidaTabletimeBlockEnumValueMap = {
  'MINUTE_1': 0,
  'MINUTE_15': 1,
  'MINUTE_30': 2,
  'MINUTE_60': 3,
};
const _BidaTabletimeBlockValueEnumMap = {
  0: BidaTimeBlock.MINUTE_1,
  1: BidaTimeBlock.MINUTE_15,
  2: BidaTimeBlock.MINUTE_30,
  3: BidaTimeBlock.MINUTE_60,
};
const _BidaTabletypeEnumValueMap = {
  'LO': 0,
  'LIBRE': 1,
  'BANG_3': 2,
};
const _BidaTabletypeValueEnumMap = {
  0: BidaTableType.LO,
  1: BidaTableType.LIBRE,
  2: BidaTableType.BANG_3,
};

Id _bidaTableGetId(BidaTable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bidaTableGetLinks(BidaTable object) {
  return [];
}

void _bidaTableAttach(IsarCollection<dynamic> col, Id id, BidaTable object) {
  object.id = id;
}

extension BidaTableByIndex on IsarCollection<BidaTable> {
  Future<BidaTable?> getByTableId(String tableId) {
    return getByIndex(r'tableId', [tableId]);
  }

  BidaTable? getByTableIdSync(String tableId) {
    return getByIndexSync(r'tableId', [tableId]);
  }

  Future<bool> deleteByTableId(String tableId) {
    return deleteByIndex(r'tableId', [tableId]);
  }

  bool deleteByTableIdSync(String tableId) {
    return deleteByIndexSync(r'tableId', [tableId]);
  }

  Future<List<BidaTable?>> getAllByTableId(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'tableId', values);
  }

  List<BidaTable?> getAllByTableIdSync(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tableId', values);
  }

  Future<int> deleteAllByTableId(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tableId', values);
  }

  int deleteAllByTableIdSync(List<String> tableIdValues) {
    final values = tableIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tableId', values);
  }

  Future<Id> putByTableId(BidaTable object) {
    return putByIndex(r'tableId', object);
  }

  Id putByTableIdSync(BidaTable object, {bool saveLinks = true}) {
    return putByIndexSync(r'tableId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTableId(List<BidaTable> objects) {
    return putAllByIndex(r'tableId', objects);
  }

  List<Id> putAllByTableIdSync(List<BidaTable> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tableId', objects, saveLinks: saveLinks);
  }
}

extension BidaTableQueryWhereSort
    on QueryBuilder<BidaTable, BidaTable, QWhere> {
  QueryBuilder<BidaTable, BidaTable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BidaTableQueryWhere
    on QueryBuilder<BidaTable, BidaTable, QWhereClause> {
  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> idBetween(
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

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> tableIdEqualTo(
      String tableId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tableId',
        value: [tableId],
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterWhereClause> tableIdNotEqualTo(
      String tableId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [],
              upper: [tableId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [tableId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [tableId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [],
              upper: [tableId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BidaTableQueryFilter
    on QueryBuilder<BidaTable, BidaTable, QFilterCondition> {
  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> hourlyPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      hourlyPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> hourlyPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hourlyPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> hourlyPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hourlyPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameContains(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusEqualTo(
      BidaTableStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusGreaterThan(
    BidaTableStatus value, {
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusLessThan(
    BidaTableStatus value, {
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> statusBetween(
    BidaTableStatus lower,
    BidaTableStatus upper, {
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

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tableId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tableId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> tableIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      tableIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tableId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> timeBlockEqualTo(
      BidaTimeBlock value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition>
      timeBlockGreaterThan(
    BidaTimeBlock value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> timeBlockLessThan(
    BidaTimeBlock value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeBlock',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> timeBlockBetween(
    BidaTimeBlock lower,
    BidaTimeBlock upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeBlock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeEqualTo(
      BidaTableType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeGreaterThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeLessThan(
    BidaTableType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterFilterCondition> typeBetween(
    BidaTableType lower,
    BidaTableType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BidaTableQueryObject
    on QueryBuilder<BidaTable, BidaTable, QFilterCondition> {}

extension BidaTableQueryLinks
    on QueryBuilder<BidaTable, BidaTable, QFilterCondition> {}

extension BidaTableQuerySortBy on QueryBuilder<BidaTable, BidaTable, QSortBy> {
  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTimeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTimeBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension BidaTableQuerySortThenBy
    on QueryBuilder<BidaTable, BidaTable, QSortThenBy> {
  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTimeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTimeBlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeBlock', Sort.desc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension BidaTableQueryWhereDistinct
    on QueryBuilder<BidaTable, BidaTable, QDistinct> {
  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hourlyPrice');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByTableId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByTimeBlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeBlock');
    });
  }

  QueryBuilder<BidaTable, BidaTable, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension BidaTableQueryProperty
    on QueryBuilder<BidaTable, BidaTable, QQueryProperty> {
  QueryBuilder<BidaTable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BidaTable, double, QQueryOperations> hourlyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hourlyPrice');
    });
  }

  QueryBuilder<BidaTable, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BidaTable, BidaTableStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BidaTable, String, QQueryOperations> tableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableId');
    });
  }

  QueryBuilder<BidaTable, BidaTimeBlock, QQueryOperations> timeBlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeBlock');
    });
  }

  QueryBuilder<BidaTable, BidaTableType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
