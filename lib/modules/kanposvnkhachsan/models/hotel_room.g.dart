// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoomTypeCollection on Isar {
  IsarCollection<RoomType> get roomTypes => this.collection();
}

const RoomTypeSchema = CollectionSchema(
  name: r'RoomType',
  id: 2148775039402291519,
  properties: {
    r'basePrice': PropertySchema(
      id: 0,
      name: r'basePrice',
      type: IsarType.double,
    ),
    r'capacity': PropertySchema(
      id: 1,
      name: r'capacity',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'hourlyPrice': PropertySchema(
      id: 3,
      name: r'hourlyPrice',
      type: IsarType.double,
    ),
    r'overnightPrice': PropertySchema(
      id: 4,
      name: r'overnightPrice',
      type: IsarType.double,
    ),
    r'typeCode': PropertySchema(
      id: 5,
      name: r'typeCode',
      type: IsarType.string,
    ),
    r'typeName': PropertySchema(
      id: 6,
      name: r'typeName',
      type: IsarType.string,
    )
  },
  estimateSize: _roomTypeEstimateSize,
  serialize: _roomTypeSerialize,
  deserialize: _roomTypeDeserialize,
  deserializeProp: _roomTypeDeserializeProp,
  idName: r'id',
  indexes: {
    r'typeCode': IndexSchema(
      id: -3291340886339158452,
      name: r'typeCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'typeCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _roomTypeGetId,
  getLinks: _roomTypeGetLinks,
  attach: _roomTypeAttach,
  version: '3.1.0+1',
);

int _roomTypeEstimateSize(
  RoomType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.typeCode.length * 3;
  bytesCount += 3 + object.typeName.length * 3;
  return bytesCount;
}

void _roomTypeSerialize(
  RoomType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.basePrice);
  writer.writeLong(offsets[1], object.capacity);
  writer.writeString(offsets[2], object.description);
  writer.writeDouble(offsets[3], object.hourlyPrice);
  writer.writeDouble(offsets[4], object.overnightPrice);
  writer.writeString(offsets[5], object.typeCode);
  writer.writeString(offsets[6], object.typeName);
}

RoomType _roomTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoomType();
  object.basePrice = reader.readDouble(offsets[0]);
  object.capacity = reader.readLong(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.hourlyPrice = reader.readDouble(offsets[3]);
  object.id = id;
  object.overnightPrice = reader.readDouble(offsets[4]);
  object.typeCode = reader.readString(offsets[5]);
  object.typeName = reader.readString(offsets[6]);
  return object;
}

P _roomTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _roomTypeGetId(RoomType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _roomTypeGetLinks(RoomType object) {
  return [];
}

void _roomTypeAttach(IsarCollection<dynamic> col, Id id, RoomType object) {
  object.id = id;
}

extension RoomTypeByIndex on IsarCollection<RoomType> {
  Future<RoomType?> getByTypeCode(String typeCode) {
    return getByIndex(r'typeCode', [typeCode]);
  }

  RoomType? getByTypeCodeSync(String typeCode) {
    return getByIndexSync(r'typeCode', [typeCode]);
  }

  Future<bool> deleteByTypeCode(String typeCode) {
    return deleteByIndex(r'typeCode', [typeCode]);
  }

  bool deleteByTypeCodeSync(String typeCode) {
    return deleteByIndexSync(r'typeCode', [typeCode]);
  }

  Future<List<RoomType?>> getAllByTypeCode(List<String> typeCodeValues) {
    final values = typeCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'typeCode', values);
  }

  List<RoomType?> getAllByTypeCodeSync(List<String> typeCodeValues) {
    final values = typeCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'typeCode', values);
  }

  Future<int> deleteAllByTypeCode(List<String> typeCodeValues) {
    final values = typeCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'typeCode', values);
  }

  int deleteAllByTypeCodeSync(List<String> typeCodeValues) {
    final values = typeCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'typeCode', values);
  }

  Future<Id> putByTypeCode(RoomType object) {
    return putByIndex(r'typeCode', object);
  }

  Id putByTypeCodeSync(RoomType object, {bool saveLinks = true}) {
    return putByIndexSync(r'typeCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTypeCode(List<RoomType> objects) {
    return putAllByIndex(r'typeCode', objects);
  }

  List<Id> putAllByTypeCodeSync(List<RoomType> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'typeCode', objects, saveLinks: saveLinks);
  }
}

extension RoomTypeQueryWhereSort on QueryBuilder<RoomType, RoomType, QWhere> {
  QueryBuilder<RoomType, RoomType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RoomTypeQueryWhere on QueryBuilder<RoomType, RoomType, QWhereClause> {
  QueryBuilder<RoomType, RoomType, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RoomType, RoomType, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterWhereClause> idBetween(
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

  QueryBuilder<RoomType, RoomType, QAfterWhereClause> typeCodeEqualTo(
      String typeCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'typeCode',
        value: [typeCode],
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterWhereClause> typeCodeNotEqualTo(
      String typeCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'typeCode',
              lower: [],
              upper: [typeCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'typeCode',
              lower: [typeCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'typeCode',
              lower: [typeCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'typeCode',
              lower: [],
              upper: [typeCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RoomTypeQueryFilter
    on QueryBuilder<RoomType, RoomType, QFilterCondition> {
  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> basePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'basePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> basePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'basePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> basePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'basePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> basePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'basePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> capacityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> capacityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> capacityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> capacityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> hourlyPriceEqualTo(
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition>
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> hourlyPriceLessThan(
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> hourlyPriceBetween(
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> overnightPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overnightPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition>
      overnightPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overnightPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition>
      overnightPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overnightPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> overnightPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overnightPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typeCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typeCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typeCode',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'typeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'typeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeName',
        value: '',
      ));
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterFilterCondition> typeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'typeName',
        value: '',
      ));
    });
  }
}

extension RoomTypeQueryObject
    on QueryBuilder<RoomType, RoomType, QFilterCondition> {}

extension RoomTypeQueryLinks
    on QueryBuilder<RoomType, RoomType, QFilterCondition> {}

extension RoomTypeQuerySortBy on QueryBuilder<RoomType, RoomType, QSortBy> {
  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByBasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByBasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByOvernightPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overnightPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByOvernightPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overnightPrice', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByTypeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCode', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByTypeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCode', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeName', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> sortByTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeName', Sort.desc);
    });
  }
}

extension RoomTypeQuerySortThenBy
    on QueryBuilder<RoomType, RoomType, QSortThenBy> {
  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByBasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByBasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'basePrice', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByHourlyPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hourlyPrice', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByOvernightPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overnightPrice', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByOvernightPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overnightPrice', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByTypeCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCode', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByTypeCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeCode', Sort.desc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByTypeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeName', Sort.asc);
    });
  }

  QueryBuilder<RoomType, RoomType, QAfterSortBy> thenByTypeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeName', Sort.desc);
    });
  }
}

extension RoomTypeQueryWhereDistinct
    on QueryBuilder<RoomType, RoomType, QDistinct> {
  QueryBuilder<RoomType, RoomType, QDistinct> distinctByBasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'basePrice');
    });
  }

  QueryBuilder<RoomType, RoomType, QDistinct> distinctByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacity');
    });
  }

  QueryBuilder<RoomType, RoomType, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomType, RoomType, QDistinct> distinctByHourlyPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hourlyPrice');
    });
  }

  QueryBuilder<RoomType, RoomType, QDistinct> distinctByOvernightPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overnightPrice');
    });
  }

  QueryBuilder<RoomType, RoomType, QDistinct> distinctByTypeCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoomType, RoomType, QDistinct> distinctByTypeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeName', caseSensitive: caseSensitive);
    });
  }
}

extension RoomTypeQueryProperty
    on QueryBuilder<RoomType, RoomType, QQueryProperty> {
  QueryBuilder<RoomType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RoomType, double, QQueryOperations> basePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'basePrice');
    });
  }

  QueryBuilder<RoomType, int, QQueryOperations> capacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacity');
    });
  }

  QueryBuilder<RoomType, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<RoomType, double, QQueryOperations> hourlyPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hourlyPrice');
    });
  }

  QueryBuilder<RoomType, double, QQueryOperations> overnightPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overnightPrice');
    });
  }

  QueryBuilder<RoomType, String, QQueryOperations> typeCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeCode');
    });
  }

  QueryBuilder<RoomType, String, QQueryOperations> typeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeName');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelFloorCollection on Isar {
  IsarCollection<HotelFloor> get hotelFloors => this.collection();
}

const HotelFloorSchema = CollectionSchema(
  name: r'HotelFloor',
  id: 3143802136735234796,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'displayOrder': PropertySchema(
      id: 1,
      name: r'displayOrder',
      type: IsarType.long,
    ),
    r'floorCode': PropertySchema(
      id: 2,
      name: r'floorCode',
      type: IsarType.string,
    ),
    r'floorName': PropertySchema(
      id: 3,
      name: r'floorName',
      type: IsarType.string,
    )
  },
  estimateSize: _hotelFloorEstimateSize,
  serialize: _hotelFloorSerialize,
  deserialize: _hotelFloorDeserialize,
  deserializeProp: _hotelFloorDeserializeProp,
  idName: r'id',
  indexes: {
    r'floorCode': IndexSchema(
      id: 3853531811187151490,
      name: r'floorCode',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'floorCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _hotelFloorGetId,
  getLinks: _hotelFloorGetLinks,
  attach: _hotelFloorAttach,
  version: '3.1.0+1',
);

int _hotelFloorEstimateSize(
  HotelFloor object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.floorCode.length * 3;
  bytesCount += 3 + object.floorName.length * 3;
  return bytesCount;
}

void _hotelFloorSerialize(
  HotelFloor object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeLong(offsets[1], object.displayOrder);
  writer.writeString(offsets[2], object.floorCode);
  writer.writeString(offsets[3], object.floorName);
}

HotelFloor _hotelFloorDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelFloor();
  object.description = reader.readString(offsets[0]);
  object.displayOrder = reader.readLong(offsets[1]);
  object.floorCode = reader.readString(offsets[2]);
  object.floorName = reader.readString(offsets[3]);
  object.id = id;
  return object;
}

P _hotelFloorDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _hotelFloorGetId(HotelFloor object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelFloorGetLinks(HotelFloor object) {
  return [];
}

void _hotelFloorAttach(IsarCollection<dynamic> col, Id id, HotelFloor object) {
  object.id = id;
}

extension HotelFloorByIndex on IsarCollection<HotelFloor> {
  Future<HotelFloor?> getByFloorCode(String floorCode) {
    return getByIndex(r'floorCode', [floorCode]);
  }

  HotelFloor? getByFloorCodeSync(String floorCode) {
    return getByIndexSync(r'floorCode', [floorCode]);
  }

  Future<bool> deleteByFloorCode(String floorCode) {
    return deleteByIndex(r'floorCode', [floorCode]);
  }

  bool deleteByFloorCodeSync(String floorCode) {
    return deleteByIndexSync(r'floorCode', [floorCode]);
  }

  Future<List<HotelFloor?>> getAllByFloorCode(List<String> floorCodeValues) {
    final values = floorCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'floorCode', values);
  }

  List<HotelFloor?> getAllByFloorCodeSync(List<String> floorCodeValues) {
    final values = floorCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'floorCode', values);
  }

  Future<int> deleteAllByFloorCode(List<String> floorCodeValues) {
    final values = floorCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'floorCode', values);
  }

  int deleteAllByFloorCodeSync(List<String> floorCodeValues) {
    final values = floorCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'floorCode', values);
  }

  Future<Id> putByFloorCode(HotelFloor object) {
    return putByIndex(r'floorCode', object);
  }

  Id putByFloorCodeSync(HotelFloor object, {bool saveLinks = true}) {
    return putByIndexSync(r'floorCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFloorCode(List<HotelFloor> objects) {
    return putAllByIndex(r'floorCode', objects);
  }

  List<Id> putAllByFloorCodeSync(List<HotelFloor> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'floorCode', objects, saveLinks: saveLinks);
  }
}

extension HotelFloorQueryWhereSort
    on QueryBuilder<HotelFloor, HotelFloor, QWhere> {
  QueryBuilder<HotelFloor, HotelFloor, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelFloorQueryWhere
    on QueryBuilder<HotelFloor, HotelFloor, QWhereClause> {
  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> idBetween(
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

  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> floorCodeEqualTo(
      String floorCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'floorCode',
        value: [floorCode],
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterWhereClause> floorCodeNotEqualTo(
      String floorCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorCode',
              lower: [],
              upper: [floorCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorCode',
              lower: [floorCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorCode',
              lower: [floorCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorCode',
              lower: [],
              upper: [floorCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HotelFloorQueryFilter
    on QueryBuilder<HotelFloor, HotelFloor, QFilterCondition> {
  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      displayOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      displayOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      displayOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      displayOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'floorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'floorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'floorCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'floorCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorCode',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'floorCode',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'floorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'floorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'floorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> floorNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'floorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition>
      floorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'floorName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HotelFloor, HotelFloor, QAfterFilterCondition> idBetween(
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
}

extension HotelFloorQueryObject
    on QueryBuilder<HotelFloor, HotelFloor, QFilterCondition> {}

extension HotelFloorQueryLinks
    on QueryBuilder<HotelFloor, HotelFloor, QFilterCondition> {}

extension HotelFloorQuerySortBy
    on QueryBuilder<HotelFloor, HotelFloor, QSortBy> {
  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByDisplayOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByDisplayOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByFloorCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCode', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByFloorCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCode', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByFloorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorName', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> sortByFloorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorName', Sort.desc);
    });
  }
}

extension HotelFloorQuerySortThenBy
    on QueryBuilder<HotelFloor, HotelFloor, QSortThenBy> {
  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByDisplayOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByDisplayOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayOrder', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByFloorCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCode', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByFloorCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorCode', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByFloorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorName', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByFloorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorName', Sort.desc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension HotelFloorQueryWhereDistinct
    on QueryBuilder<HotelFloor, HotelFloor, QDistinct> {
  QueryBuilder<HotelFloor, HotelFloor, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QDistinct> distinctByDisplayOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayOrder');
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QDistinct> distinctByFloorCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelFloor, HotelFloor, QDistinct> distinctByFloorName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorName', caseSensitive: caseSensitive);
    });
  }
}

extension HotelFloorQueryProperty
    on QueryBuilder<HotelFloor, HotelFloor, QQueryProperty> {
  QueryBuilder<HotelFloor, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelFloor, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<HotelFloor, int, QQueryOperations> displayOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayOrder');
    });
  }

  QueryBuilder<HotelFloor, String, QQueryOperations> floorCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorCode');
    });
  }

  QueryBuilder<HotelFloor, String, QQueryOperations> floorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorName');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHotelRoomCollection on Isar {
  IsarCollection<HotelRoom> get hotelRooms => this.collection();
}

const HotelRoomSchema = CollectionSchema(
  name: r'HotelRoom',
  id: -1014523929769406762,
  properties: {
    r'activeCheckInId': PropertySchema(
      id: 0,
      name: r'activeCheckInId',
      type: IsarType.string,
    ),
    r'activeReservationId': PropertySchema(
      id: 1,
      name: r'activeReservationId',
      type: IsarType.string,
    ),
    r'note': PropertySchema(
      id: 2,
      name: r'note',
      type: IsarType.string,
    ),
    r'roomId': PropertySchema(
      id: 3,
      name: r'roomId',
      type: IsarType.string,
    ),
    r'roomName': PropertySchema(
      id: 4,
      name: r'roomName',
      type: IsarType.string,
    ),
    r'roomNumber': PropertySchema(
      id: 5,
      name: r'roomNumber',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _HotelRoomstatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _hotelRoomEstimateSize,
  serialize: _hotelRoomSerialize,
  deserialize: _hotelRoomDeserialize,
  deserializeProp: _hotelRoomDeserializeProp,
  idName: r'id',
  indexes: {
    r'roomId': IndexSchema(
      id: -3609232324653216207,
      name: r'roomId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'roomId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'floor': LinkSchema(
      id: 3449713627608943154,
      name: r'floor',
      target: r'HotelFloor',
      single: true,
    ),
    r'roomType': LinkSchema(
      id: 1265970781345669161,
      name: r'roomType',
      target: r'RoomType',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _hotelRoomGetId,
  getLinks: _hotelRoomGetLinks,
  attach: _hotelRoomAttach,
  version: '3.1.0+1',
);

int _hotelRoomEstimateSize(
  HotelRoom object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeCheckInId.length * 3;
  bytesCount += 3 + object.activeReservationId.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.roomId.length * 3;
  bytesCount += 3 + object.roomName.length * 3;
  bytesCount += 3 + object.roomNumber.length * 3;
  return bytesCount;
}

void _hotelRoomSerialize(
  HotelRoom object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeCheckInId);
  writer.writeString(offsets[1], object.activeReservationId);
  writer.writeString(offsets[2], object.note);
  writer.writeString(offsets[3], object.roomId);
  writer.writeString(offsets[4], object.roomName);
  writer.writeString(offsets[5], object.roomNumber);
  writer.writeByte(offsets[6], object.status.index);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

HotelRoom _hotelRoomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HotelRoom();
  object.activeCheckInId = reader.readString(offsets[0]);
  object.activeReservationId = reader.readString(offsets[1]);
  object.id = id;
  object.note = reader.readString(offsets[2]);
  object.roomId = reader.readString(offsets[3]);
  object.roomName = reader.readString(offsets[4]);
  object.roomNumber = reader.readString(offsets[5]);
  object.status =
      _HotelRoomstatusValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          RoomStatus.AVAILABLE;
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _hotelRoomDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_HotelRoomstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          RoomStatus.AVAILABLE) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HotelRoomstatusEnumValueMap = {
  'AVAILABLE': 0,
  'OCCUPIED': 1,
  'RESERVED': 2,
  'CLEANING': 3,
  'MAINTENANCE': 4,
};
const _HotelRoomstatusValueEnumMap = {
  0: RoomStatus.AVAILABLE,
  1: RoomStatus.OCCUPIED,
  2: RoomStatus.RESERVED,
  3: RoomStatus.CLEANING,
  4: RoomStatus.MAINTENANCE,
};

Id _hotelRoomGetId(HotelRoom object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _hotelRoomGetLinks(HotelRoom object) {
  return [object.floor, object.roomType];
}

void _hotelRoomAttach(IsarCollection<dynamic> col, Id id, HotelRoom object) {
  object.id = id;
  object.floor.attach(col, col.isar.collection<HotelFloor>(), r'floor', id);
  object.roomType.attach(col, col.isar.collection<RoomType>(), r'roomType', id);
}

extension HotelRoomByIndex on IsarCollection<HotelRoom> {
  Future<HotelRoom?> getByRoomId(String roomId) {
    return getByIndex(r'roomId', [roomId]);
  }

  HotelRoom? getByRoomIdSync(String roomId) {
    return getByIndexSync(r'roomId', [roomId]);
  }

  Future<bool> deleteByRoomId(String roomId) {
    return deleteByIndex(r'roomId', [roomId]);
  }

  bool deleteByRoomIdSync(String roomId) {
    return deleteByIndexSync(r'roomId', [roomId]);
  }

  Future<List<HotelRoom?>> getAllByRoomId(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'roomId', values);
  }

  List<HotelRoom?> getAllByRoomIdSync(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'roomId', values);
  }

  Future<int> deleteAllByRoomId(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'roomId', values);
  }

  int deleteAllByRoomIdSync(List<String> roomIdValues) {
    final values = roomIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'roomId', values);
  }

  Future<Id> putByRoomId(HotelRoom object) {
    return putByIndex(r'roomId', object);
  }

  Id putByRoomIdSync(HotelRoom object, {bool saveLinks = true}) {
    return putByIndexSync(r'roomId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRoomId(List<HotelRoom> objects) {
    return putAllByIndex(r'roomId', objects);
  }

  List<Id> putAllByRoomIdSync(List<HotelRoom> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'roomId', objects, saveLinks: saveLinks);
  }
}

extension HotelRoomQueryWhereSort
    on QueryBuilder<HotelRoom, HotelRoom, QWhere> {
  QueryBuilder<HotelRoom, HotelRoom, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HotelRoomQueryWhere
    on QueryBuilder<HotelRoom, HotelRoom, QWhereClause> {
  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> idBetween(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> roomIdEqualTo(
      String roomId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'roomId',
        value: [roomId],
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterWhereClause> roomIdNotEqualTo(
      String roomId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [],
              upper: [roomId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [roomId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [roomId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'roomId',
              lower: [],
              upper: [roomId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension HotelRoomQueryFilter
    on QueryBuilder<HotelRoom, HotelRoom, QFilterCondition> {
  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeCheckInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeCheckInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeCheckInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeCheckInId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeCheckInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeCheckInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeCheckInId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeCheckInId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeCheckInId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeCheckInIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeCheckInId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeReservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeReservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeReservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeReservationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeReservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeReservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeReservationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeReservationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeReservationId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      activeReservationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeReservationId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteEqualTo(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteGreaterThan(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteLessThan(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteBetween(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteStartsWith(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteEndsWith(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'note',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'note',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'note',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomId',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      roomNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomName',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      roomNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'roomNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      roomNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'roomNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'roomNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      roomNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'roomNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
      roomNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'roomNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> statusEqualTo(
      RoomStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> statusGreaterThan(
    RoomStatus value, {
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> statusLessThan(
    RoomStatus value, {
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> statusBetween(
    RoomStatus lower,
    RoomStatus upper, {
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition>
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> updatedAtBetween(
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

extension HotelRoomQueryObject
    on QueryBuilder<HotelRoom, HotelRoom, QFilterCondition> {}

extension HotelRoomQueryLinks
    on QueryBuilder<HotelRoom, HotelRoom, QFilterCondition> {
  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> floor(
      FilterQuery<HotelFloor> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'floor');
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> floorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'floor', 0, true, 0, true);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomType(
      FilterQuery<RoomType> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'roomType');
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterFilterCondition> roomTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'roomType', 0, true, 0, true);
    });
  }
}

extension HotelRoomQuerySortBy on QueryBuilder<HotelRoom, HotelRoom, QSortBy> {
  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByActiveCheckInId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCheckInId', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByActiveCheckInIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCheckInId', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByActiveReservationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeReservationId', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy>
      sortByActiveReservationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeReservationId', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByRoomName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByRoomNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByRoomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByRoomNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension HotelRoomQuerySortThenBy
    on QueryBuilder<HotelRoom, HotelRoom, QSortThenBy> {
  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByActiveCheckInId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCheckInId', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByActiveCheckInIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeCheckInId', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByActiveReservationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeReservationId', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy>
      thenByActiveReservationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeReservationId', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomId', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByRoomName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByRoomNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomName', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByRoomNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByRoomNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'roomNumber', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension HotelRoomQueryWhereDistinct
    on QueryBuilder<HotelRoom, HotelRoom, QDistinct> {
  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByActiveCheckInId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeCheckInId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByActiveReservationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeReservationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByRoomId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByRoomName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByRoomNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'roomNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<HotelRoom, HotelRoom, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension HotelRoomQueryProperty
    on QueryBuilder<HotelRoom, HotelRoom, QQueryProperty> {
  QueryBuilder<HotelRoom, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HotelRoom, String, QQueryOperations> activeCheckInIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeCheckInId');
    });
  }

  QueryBuilder<HotelRoom, String, QQueryOperations>
      activeReservationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeReservationId');
    });
  }

  QueryBuilder<HotelRoom, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<HotelRoom, String, QQueryOperations> roomIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomId');
    });
  }

  QueryBuilder<HotelRoom, String, QQueryOperations> roomNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomName');
    });
  }

  QueryBuilder<HotelRoom, String, QQueryOperations> roomNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'roomNumber');
    });
  }

  QueryBuilder<HotelRoom, RoomStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<HotelRoom, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
