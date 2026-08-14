// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_booking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRealEstateBookingCollection on Isar {
  IsarCollection<RealEstateBooking> get realEstateBookings => this.collection();
}

const RealEstateBookingSchema = CollectionSchema(
  name: r'RealEstateBooking',
  id: -3029634944801538022,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'depositAmount': PropertySchema(
      id: 1,
      name: r'depositAmount',
      type: IsarType.double,
    ),
    r'realEstateUuid': PropertySchema(
      id: 2,
      name: r'realEstateUuid',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.byte,
      enumMap: _RealEstateBookingstatusEnumValueMap,
    ),
    r'userUuid': PropertySchema(
      id: 4,
      name: r'userUuid',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 5,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _realEstateBookingEstimateSize,
  serialize: _realEstateBookingSerialize,
  deserialize: _realEstateBookingDeserialize,
  deserializeProp: _realEstateBookingDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'realEstateUuid': IndexSchema(
      id: -5343123089898822750,
      name: r'realEstateUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'realEstateUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _realEstateBookingGetId,
  getLinks: _realEstateBookingGetLinks,
  attach: _realEstateBookingAttach,
  version: '3.1.0+1',
);

int _realEstateBookingEstimateSize(
  RealEstateBooking object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.realEstateUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _realEstateBookingSerialize(
  RealEstateBooking object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDouble(offsets[1], object.depositAmount);
  writer.writeString(offsets[2], object.realEstateUuid);
  writer.writeByte(offsets[3], object.status.index);
  writer.writeString(offsets[4], object.userUuid);
  writer.writeString(offsets[5], object.uuid);
}

RealEstateBooking _realEstateBookingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RealEstateBooking();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.depositAmount = reader.readDouble(offsets[1]);
  object.id = id;
  object.realEstateUuid = reader.readStringOrNull(offsets[2]);
  object.status =
      _RealEstateBookingstatusValueEnumMap[reader.readByteOrNull(offsets[3])] ??
          BookingStatus.pending;
  object.userUuid = reader.readStringOrNull(offsets[4]);
  object.uuid = reader.readStringOrNull(offsets[5]);
  return object;
}

P _realEstateBookingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_RealEstateBookingstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BookingStatus.pending) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RealEstateBookingstatusEnumValueMap = {
  'pending': 0,
  'accepted': 1,
  'rejected': 2,
};
const _RealEstateBookingstatusValueEnumMap = {
  0: BookingStatus.pending,
  1: BookingStatus.accepted,
  2: BookingStatus.rejected,
};

Id _realEstateBookingGetId(RealEstateBooking object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _realEstateBookingGetLinks(
    RealEstateBooking object) {
  return [];
}

void _realEstateBookingAttach(
    IsarCollection<dynamic> col, Id id, RealEstateBooking object) {
  object.id = id;
}

extension RealEstateBookingByIndex on IsarCollection<RealEstateBooking> {
  Future<RealEstateBooking?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  RealEstateBooking? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<RealEstateBooking?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<RealEstateBooking?> getAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(RealEstateBooking object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(RealEstateBooking object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<RealEstateBooking> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<RealEstateBooking> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension RealEstateBookingQueryWhereSort
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QWhere> {
  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RealEstateBookingQueryWhere
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QWhereClause> {
  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'uuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      uuidNotEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      realEstateUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'realEstateUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      realEstateUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'realEstateUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      realEstateUuidEqualTo(String? realEstateUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'realEstateUuid',
        value: [realEstateUuid],
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterWhereClause>
      realEstateUuidNotEqualTo(String? realEstateUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'realEstateUuid',
              lower: [],
              upper: [realEstateUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'realEstateUuid',
              lower: [realEstateUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'realEstateUuid',
              lower: [realEstateUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'realEstateUuid',
              lower: [],
              upper: [realEstateUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RealEstateBookingQueryFilter
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QFilterCondition> {
  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      depositAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      depositAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      depositAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'depositAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      depositAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'depositAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'realEstateUuid',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'realEstateUuid',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'realEstateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'realEstateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'realEstateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'realEstateUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'realEstateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'realEstateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'realEstateUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'realEstateUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'realEstateUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      realEstateUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'realEstateUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      statusEqualTo(BookingStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      statusGreaterThan(
    BookingStatus value, {
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      statusLessThan(
    BookingStatus value, {
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      statusBetween(
    BookingStatus lower,
    BookingStatus upper, {
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

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userUuid',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userUuid',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      userUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension RealEstateBookingQueryObject
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QFilterCondition> {}

extension RealEstateBookingQueryLinks
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QFilterCondition> {}

extension RealEstateBookingQuerySortBy
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QSortBy> {
  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByRealEstateUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'realEstateUuid', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByRealEstateUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'realEstateUuid', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension RealEstateBookingQuerySortThenBy
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QSortThenBy> {
  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByRealEstateUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'realEstateUuid', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByRealEstateUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'realEstateUuid', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension RealEstateBookingQueryWhereDistinct
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct> {
  QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct>
      distinctByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depositAmount');
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct>
      distinctByRealEstateUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'realEstateUuid',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct>
      distinctByUserUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RealEstateBooking, RealEstateBooking, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension RealEstateBookingQueryProperty
    on QueryBuilder<RealEstateBooking, RealEstateBooking, QQueryProperty> {
  QueryBuilder<RealEstateBooking, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RealEstateBooking, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<RealEstateBooking, double, QQueryOperations>
      depositAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depositAmount');
    });
  }

  QueryBuilder<RealEstateBooking, String?, QQueryOperations>
      realEstateUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'realEstateUuid');
    });
  }

  QueryBuilder<RealEstateBooking, BookingStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<RealEstateBooking, String?, QQueryOperations>
      userUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUuid');
    });
  }

  QueryBuilder<RealEstateBooking, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
