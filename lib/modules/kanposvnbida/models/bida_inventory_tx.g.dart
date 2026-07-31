// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bida_inventory_tx.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBidaInventoryTxCollection on Isar {
  IsarCollection<BidaInventoryTx> get bidaInventoryTxs => this.collection();
}

const BidaInventoryTxSchema = CollectionSchema(
  name: r'BidaInventoryTx',
  id: 3895216686780259418,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'itemId': PropertySchema(
      id: 1,
      name: r'itemId',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 2,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 3,
      name: r'note',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BidaInventoryTxtypeEnumValueMap,
    )
  },
  estimateSize: _bidaInventoryTxEstimateSize,
  serialize: _bidaInventoryTxSerialize,
  deserialize: _bidaInventoryTxDeserialize,
  deserializeProp: _bidaInventoryTxDeserializeProp,
  idName: r'id',
  indexes: {
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
  getId: _bidaInventoryTxGetId,
  getLinks: _bidaInventoryTxGetLinks,
  attach: _bidaInventoryTxAttach,
  version: '3.1.0+1',
);

int _bidaInventoryTxEstimateSize(
  BidaInventoryTx object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.itemId.length * 3;
  bytesCount += 3 + object.itemName.length * 3;
  bytesCount += 3 + object.note.length * 3;
  return bytesCount;
}

void _bidaInventoryTxSerialize(
  BidaInventoryTx object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.itemId);
  writer.writeString(offsets[2], object.itemName);
  writer.writeString(offsets[3], object.note);
  writer.writeLong(offsets[4], object.quantity);
  writer.writeByte(offsets[5], object.type.index);
}

BidaInventoryTx _bidaInventoryTxDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BidaInventoryTx();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.itemId = reader.readString(offsets[1]);
  object.itemName = reader.readString(offsets[2]);
  object.note = reader.readString(offsets[3]);
  object.quantity = reader.readLong(offsets[4]);
  object.type =
      _BidaInventoryTxtypeValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          BidaInventoryTxType.IMPORT;
  return object;
}

P _bidaInventoryTxDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_BidaInventoryTxtypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BidaInventoryTxType.IMPORT) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BidaInventoryTxtypeEnumValueMap = {
  'IMPORT': 0,
  'EXPORT': 1,
};
const _BidaInventoryTxtypeValueEnumMap = {
  0: BidaInventoryTxType.IMPORT,
  1: BidaInventoryTxType.EXPORT,
};

Id _bidaInventoryTxGetId(BidaInventoryTx object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bidaInventoryTxGetLinks(BidaInventoryTx object) {
  return [];
}

void _bidaInventoryTxAttach(
    IsarCollection<dynamic> col, Id id, BidaInventoryTx object) {
  object.id = id;
}

extension BidaInventoryTxQueryWhereSort
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QWhere> {
  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension BidaInventoryTxQueryWhere
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QWhereClause> {
  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause> idBetween(
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterWhereClause>
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

extension BidaInventoryTxQueryFilter
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QFilterCondition> {
  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemId',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteEqualTo(
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteLessThan(
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteBetween(
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteEndsWith(
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      typeEqualTo(BidaInventoryTxType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      typeGreaterThan(
    BidaInventoryTxType value, {
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      typeLessThan(
    BidaInventoryTxType value, {
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

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterFilterCondition>
      typeBetween(
    BidaInventoryTxType lower,
    BidaInventoryTxType upper, {
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

extension BidaInventoryTxQueryObject
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QFilterCondition> {}

extension BidaInventoryTxQueryLinks
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QFilterCondition> {}

extension BidaInventoryTxQuerySortBy
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QSortBy> {
  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> sortByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension BidaInventoryTxQuerySortThenBy
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QSortThenBy> {
  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> thenByItemId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByItemIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemId', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension BidaInventoryTxQueryWhereDistinct
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct> {
  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct> distinctByItemId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTx, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension BidaInventoryTxQueryProperty
    on QueryBuilder<BidaInventoryTx, BidaInventoryTx, QQueryProperty> {
  QueryBuilder<BidaInventoryTx, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BidaInventoryTx, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BidaInventoryTx, String, QQueryOperations> itemIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemId');
    });
  }

  QueryBuilder<BidaInventoryTx, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<BidaInventoryTx, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<BidaInventoryTx, int, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<BidaInventoryTx, BidaInventoryTxType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
