// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thong_so.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetThongSoCollection on Isar {
  IsarCollection<ThongSo> get thongSos => this.collection();
}

const ThongSoSchema = CollectionSchema(
  name: r'ThongSo',
  id: -897330492750985102,
  properties: {
    r'bundleNo': PropertySchema(
      id: 0,
      name: r'bundleNo',
      type: IsarType.long,
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
    r'idGen': PropertySchema(
      id: 3,
      name: r'idGen',
      type: IsarType.long,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'pieces': PropertySchema(
      id: 5,
      name: r'pieces',
      type: IsarType.long,
    ),
    r'poNo': PropertySchema(
      id: 6,
      name: r'poNo',
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
  estimateSize: _thongSoEstimateSize,
  serialize: _thongSoSerialize,
  deserialize: _thongSoDeserialize,
  deserializeProp: _thongSoDeserializeProp,
  idName: r'id',
  indexes: {
    r'idGen': IndexSchema(
      id: 411966946173493191,
      name: r'idGen',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idGen',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _thongSoGetId,
  getLinks: _thongSoGetLinks,
  attach: _thongSoAttach,
  version: '3.1.0+1',
);

int _thongSoEstimateSize(
  ThongSo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.poNo.length * 3;
  return bytesCount;
}

void _thongSoSerialize(
  ThongSo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bundleNo);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeLong(offsets[3], object.idGen);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeLong(offsets[5], object.pieces);
  writer.writeString(offsets[6], object.poNo);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeLong(offsets[8], object.version);
}

ThongSo _thongSoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ThongSo();
  object.bundleNo = reader.readLong(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.id = id;
  object.idGen = reader.readLong(offsets[3]);
  object.isSynced = reader.readBool(offsets[4]);
  object.pieces = reader.readLong(offsets[5]);
  object.poNo = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.version = reader.readLong(offsets[8]);
  return object;
}

P _thongSoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
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

Id _thongSoGetId(ThongSo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _thongSoGetLinks(ThongSo object) {
  return [];
}

void _thongSoAttach(IsarCollection<dynamic> col, Id id, ThongSo object) {
  object.id = id;
}

extension ThongSoQueryWhereSort on QueryBuilder<ThongSo, ThongSo, QWhere> {
  QueryBuilder<ThongSo, ThongSo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhere> anyIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idGen'),
      );
    });
  }
}

extension ThongSoQueryWhere on QueryBuilder<ThongSo, ThongSo, QWhereClause> {
  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idBetween(
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

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idGenEqualTo(int idGen) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idGen',
        value: [idGen],
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idGenNotEqualTo(int idGen) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [],
              upper: [idGen],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [idGen],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [idGen],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idGen',
              lower: [],
              upper: [idGen],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idGenGreaterThan(
    int idGen, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idGen',
        lower: [idGen],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idGenLessThan(
    int idGen, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idGen',
        lower: [],
        upper: [idGen],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterWhereClause> idGenBetween(
    int lowerIdGen,
    int upperIdGen, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idGen',
        lower: [lowerIdGen],
        includeLower: includeLower,
        upper: [upperIdGen],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ThongSoQueryFilter
    on QueryBuilder<ThongSo, ThongSo, QFilterCondition> {
  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> bundleNoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bundleNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> bundleNoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bundleNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> bundleNoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bundleNo',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> bundleNoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bundleNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdContains(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdMatches(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idGenEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idGenGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idGenLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idGen',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> idGenBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idGen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> piecesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pieces',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> piecesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pieces',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> piecesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pieces',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> piecesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pieces',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'poNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'poNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> poNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poNo',
        value: '',
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> versionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<ThongSo, ThongSo, QAfterFilterCondition> versionBetween(
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

extension ThongSoQueryObject
    on QueryBuilder<ThongSo, ThongSo, QFilterCondition> {}

extension ThongSoQueryLinks
    on QueryBuilder<ThongSo, ThongSo, QFilterCondition> {}

extension ThongSoQuerySortBy on QueryBuilder<ThongSo, ThongSo, QSortBy> {
  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByBundleNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bundleNo', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByBundleNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bundleNo', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByIdGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByPieces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pieces', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByPiecesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pieces', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByPoNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByPoNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ThongSoQuerySortThenBy
    on QueryBuilder<ThongSo, ThongSo, QSortThenBy> {
  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByBundleNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bundleNo', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByBundleNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bundleNo', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByIdGenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idGen', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByPieces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pieces', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByPiecesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pieces', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByPoNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByPoNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poNo', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension ThongSoQueryWhereDistinct
    on QueryBuilder<ThongSo, ThongSo, QDistinct> {
  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByBundleNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bundleNo');
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByDeviceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByIdGen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idGen');
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByPieces() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pieces');
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByPoNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ThongSo, ThongSo, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension ThongSoQueryProperty
    on QueryBuilder<ThongSo, ThongSo, QQueryProperty> {
  QueryBuilder<ThongSo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ThongSo, int, QQueryOperations> bundleNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bundleNo');
    });
  }

  QueryBuilder<ThongSo, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<ThongSo, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<ThongSo, int, QQueryOperations> idGenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idGen');
    });
  }

  QueryBuilder<ThongSo, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ThongSo, int, QQueryOperations> piecesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pieces');
    });
  }

  QueryBuilder<ThongSo, String, QQueryOperations> poNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poNo');
    });
  }

  QueryBuilder<ThongSo, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ThongSo, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
