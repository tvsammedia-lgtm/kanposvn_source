// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingRentalCollection on Isar {
  IsarCollection<ParkingRental> get parkingRentals => this.collection();
}

const ParkingRentalSchema = CollectionSchema(
  name: r'ParkingRental',
  id: -5289951151749151147,
  properties: {
    r'actualReturnTime': PropertySchema(
      id: 0,
      name: r'actualReturnTime',
      type: IsarType.dateTime,
    ),
    r'customerCccd': PropertySchema(
      id: 1,
      name: r'customerCccd',
      type: IsarType.string,
    ),
    r'customerName': PropertySchema(
      id: 2,
      name: r'customerName',
      type: IsarType.string,
    ),
    r'customerPhone': PropertySchema(
      id: 3,
      name: r'customerPhone',
      type: IsarType.string,
    ),
    r'depositAmount': PropertySchema(
      id: 4,
      name: r'depositAmount',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 5,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'licensePlate': PropertySchema(
      id: 6,
      name: r'licensePlate',
      type: IsarType.string,
    ),
    r'rentEndTime': PropertySchema(
      id: 7,
      name: r'rentEndTime',
      type: IsarType.dateTime,
    ),
    r'rentStartTime': PropertySchema(
      id: 8,
      name: r'rentStartTime',
      type: IsarType.dateTime,
    ),
    r'rentalFee': PropertySchema(
      id: 9,
      name: r'rentalFee',
      type: IsarType.double,
    ),
    r'rentalId': PropertySchema(
      id: 10,
      name: r'rentalId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vehicleId': PropertySchema(
      id: 13,
      name: r'vehicleId',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingRentalEstimateSize,
  serialize: _parkingRentalSerialize,
  deserialize: _parkingRentalDeserialize,
  deserializeProp: _parkingRentalDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'rentalId': IndexSchema(
      id: -1174179388413758664,
      name: r'rentalId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'rentalId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parkingRentalGetId,
  getLinks: _parkingRentalGetLinks,
  attach: _parkingRentalAttach,
  version: '3.1.0+1',
);

int _parkingRentalEstimateSize(
  ParkingRental object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.customerCccd.length * 3;
  bytesCount += 3 + object.customerName.length * 3;
  bytesCount += 3 + object.customerPhone.length * 3;
  bytesCount += 3 + object.licensePlate.length * 3;
  bytesCount += 3 + object.rentalId.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.vehicleId.length * 3;
  return bytesCount;
}

void _parkingRentalSerialize(
  ParkingRental object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualReturnTime);
  writer.writeString(offsets[1], object.customerCccd);
  writer.writeString(offsets[2], object.customerName);
  writer.writeString(offsets[3], object.customerPhone);
  writer.writeDouble(offsets[4], object.depositAmount);
  writer.writeBool(offsets[5], object.isSynced);
  writer.writeString(offsets[6], object.licensePlate);
  writer.writeDateTime(offsets[7], object.rentEndTime);
  writer.writeDateTime(offsets[8], object.rentStartTime);
  writer.writeDouble(offsets[9], object.rentalFee);
  writer.writeString(offsets[10], object.rentalId);
  writer.writeString(offsets[11], object.status);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.vehicleId);
}

ParkingRental _parkingRentalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingRental();
  object.actualReturnTime = reader.readDateTimeOrNull(offsets[0]);
  object.customerCccd = reader.readString(offsets[1]);
  object.customerName = reader.readString(offsets[2]);
  object.customerPhone = reader.readString(offsets[3]);
  object.depositAmount = reader.readDouble(offsets[4]);
  object.isSynced = reader.readBool(offsets[5]);
  object.isarId = id;
  object.licensePlate = reader.readString(offsets[6]);
  object.rentEndTime = reader.readDateTime(offsets[7]);
  object.rentStartTime = reader.readDateTime(offsets[8]);
  object.rentalFee = reader.readDouble(offsets[9]);
  object.rentalId = reader.readString(offsets[10]);
  object.status = reader.readString(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.vehicleId = reader.readString(offsets[13]);
  return object;
}

P _parkingRentalDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingRentalGetId(ParkingRental object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parkingRentalGetLinks(ParkingRental object) {
  return [];
}

void _parkingRentalAttach(
    IsarCollection<dynamic> col, Id id, ParkingRental object) {
  object.isarId = id;
}

extension ParkingRentalByIndex on IsarCollection<ParkingRental> {
  Future<ParkingRental?> getByRentalId(String rentalId) {
    return getByIndex(r'rentalId', [rentalId]);
  }

  ParkingRental? getByRentalIdSync(String rentalId) {
    return getByIndexSync(r'rentalId', [rentalId]);
  }

  Future<bool> deleteByRentalId(String rentalId) {
    return deleteByIndex(r'rentalId', [rentalId]);
  }

  bool deleteByRentalIdSync(String rentalId) {
    return deleteByIndexSync(r'rentalId', [rentalId]);
  }

  Future<List<ParkingRental?>> getAllByRentalId(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'rentalId', values);
  }

  List<ParkingRental?> getAllByRentalIdSync(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'rentalId', values);
  }

  Future<int> deleteAllByRentalId(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'rentalId', values);
  }

  int deleteAllByRentalIdSync(List<String> rentalIdValues) {
    final values = rentalIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'rentalId', values);
  }

  Future<Id> putByRentalId(ParkingRental object) {
    return putByIndex(r'rentalId', object);
  }

  Id putByRentalIdSync(ParkingRental object, {bool saveLinks = true}) {
    return putByIndexSync(r'rentalId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRentalId(List<ParkingRental> objects) {
    return putAllByIndex(r'rentalId', objects);
  }

  List<Id> putAllByRentalIdSync(List<ParkingRental> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'rentalId', objects, saveLinks: saveLinks);
  }
}

extension ParkingRentalQueryWhereSort
    on QueryBuilder<ParkingRental, ParkingRental, QWhere> {
  QueryBuilder<ParkingRental, ParkingRental, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingRentalQueryWhere
    on QueryBuilder<ParkingRental, ParkingRental, QWhereClause> {
  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause> rentalIdEqualTo(
      String rentalId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rentalId',
        value: [rentalId],
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterWhereClause>
      rentalIdNotEqualTo(String rentalId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [],
              upper: [rentalId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [rentalId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [rentalId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rentalId',
              lower: [],
              upper: [rentalId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParkingRentalQueryFilter
    on QueryBuilder<ParkingRental, ParkingRental, QFilterCondition> {
  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      actualReturnTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualReturnTime',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      actualReturnTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualReturnTime',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      actualReturnTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualReturnTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      actualReturnTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualReturnTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      actualReturnTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualReturnTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      actualReturnTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualReturnTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerCccd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerCccd',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerCccd',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerCccd',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerCccdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerCccd',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      customerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'licensePlate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'licensePlate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'licensePlate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      licensePlateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'licensePlate',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentEndTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentEndTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentEndTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentEndTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentEndTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentEndTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentStartTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentStartTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentStartTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentStartTime',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentStartTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentStartTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalFeeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentalFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalFeeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentalFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalFeeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentalFee',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalFeeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentalFee',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rentalId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rentalId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rentalId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rentalId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      rentalIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rentalId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusEqualTo(
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusGreaterThan(
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusLessThan(
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusBetween(
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusEndsWith(
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
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

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleId',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterFilterCondition>
      vehicleIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleId',
        value: '',
      ));
    });
  }
}

extension ParkingRentalQueryObject
    on QueryBuilder<ParkingRental, ParkingRental, QFilterCondition> {}

extension ParkingRentalQueryLinks
    on QueryBuilder<ParkingRental, ParkingRental, QFilterCondition> {}

extension ParkingRentalQuerySortBy
    on QueryBuilder<ParkingRental, ParkingRental, QSortBy> {
  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByActualReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByActualReturnTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByCustomerCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByCustomerCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByRentEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentEndTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByRentEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentEndTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByRentStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentStartTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByRentStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentStartTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByRentalFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalFee', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByRentalFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalFee', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByRentalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByRentalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> sortByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      sortByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension ParkingRentalQuerySortThenBy
    on QueryBuilder<ParkingRental, ParkingRental, QSortThenBy> {
  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByActualReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByActualReturnTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualReturnTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByCustomerCccd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByCustomerCccdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerCccd', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByCustomerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByCustomerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerName', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByCustomerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByCustomerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerPhone', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByDepositAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'depositAmount', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByLicensePlate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByLicensePlateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'licensePlate', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByRentEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentEndTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByRentEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentEndTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByRentStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentStartTime', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByRentStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentStartTime', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByRentalFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalFee', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByRentalFeeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalFee', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByRentalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByRentalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rentalId', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy> thenByVehicleId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.asc);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QAfterSortBy>
      thenByVehicleIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleId', Sort.desc);
    });
  }
}

extension ParkingRentalQueryWhereDistinct
    on QueryBuilder<ParkingRental, ParkingRental, QDistinct> {
  QueryBuilder<ParkingRental, ParkingRental, QDistinct>
      distinctByActualReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualReturnTime');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByCustomerCccd(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerCccd', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByCustomerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByCustomerPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerPhone',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct>
      distinctByDepositAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'depositAmount');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByLicensePlate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'licensePlate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct>
      distinctByRentEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentEndTime');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct>
      distinctByRentStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentStartTime');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByRentalFee() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentalFee');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByRentalId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rentalId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ParkingRental, ParkingRental, QDistinct> distinctByVehicleId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleId', caseSensitive: caseSensitive);
    });
  }
}

extension ParkingRentalQueryProperty
    on QueryBuilder<ParkingRental, ParkingRental, QQueryProperty> {
  QueryBuilder<ParkingRental, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<ParkingRental, DateTime?, QQueryOperations>
      actualReturnTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualReturnTime');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations> customerCccdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerCccd');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations> customerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerName');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations>
      customerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerPhone');
    });
  }

  QueryBuilder<ParkingRental, double, QQueryOperations>
      depositAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'depositAmount');
    });
  }

  QueryBuilder<ParkingRental, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations> licensePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'licensePlate');
    });
  }

  QueryBuilder<ParkingRental, DateTime, QQueryOperations>
      rentEndTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentEndTime');
    });
  }

  QueryBuilder<ParkingRental, DateTime, QQueryOperations>
      rentStartTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentStartTime');
    });
  }

  QueryBuilder<ParkingRental, double, QQueryOperations> rentalFeeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentalFee');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations> rentalIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rentalId');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<ParkingRental, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ParkingRental, String, QQueryOperations> vehicleIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleId');
    });
  }
}
