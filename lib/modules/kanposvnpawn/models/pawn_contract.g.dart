// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pawn_contract.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPawnContractCollection on Isar {
  IsarCollection<PawnContract> get pawnContracts => this.collection();
}

const PawnContractSchema = CollectionSchema(
  name: r'PawnContract',
  id: 2102695799487434953,
  properties: {
    r'assetImage': PropertySchema(
      id: 0,
      name: r'assetImage',
      type: IsarType.string,
    ),
    r'assetValue': PropertySchema(
      id: 1,
      name: r'assetValue',
      type: IsarType.double,
    ),
    r'cccdImageBack': PropertySchema(
      id: 2,
      name: r'cccdImageBack',
      type: IsarType.string,
    ),
    r'cccdImageFront': PropertySchema(
      id: 3,
      name: r'cccdImageFront',
      type: IsarType.string,
    ),
    r'cccdNumber': PropertySchema(
      id: 4,
      name: r'cccdNumber',
      type: IsarType.string,
    ),
    r'contractNumber': PropertySchema(
      id: 5,
      name: r'contractNumber',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 6,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 7,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 8,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'imei': PropertySchema(
      id: 9,
      name: r'imei',
      type: IsarType.string,
    ),
    r'interestRate': PropertySchema(
      id: 10,
      name: r'interestRate',
      type: IsarType.double,
    ),
    r'interestType': PropertySchema(
      id: 11,
      name: r'interestType',
      type: IsarType.byte,
      enumMap: _PawnContractinterestTypeEnumValueMap,
    ),
    r'numberOfDays': PropertySchema(
      id: 12,
      name: r'numberOfDays',
      type: IsarType.long,
    ),
    r'paidInterest': PropertySchema(
      id: 13,
      name: r'paidInterest',
      type: IsarType.double,
    ),
    r'pawnAmount': PropertySchema(
      id: 14,
      name: r'pawnAmount',
      type: IsarType.double,
    ),
    r'pawnDate': PropertySchema(
      id: 15,
      name: r'pawnDate',
      type: IsarType.dateTime,
    ),
    r'portraitImage': PropertySchema(
      id: 16,
      name: r'portraitImage',
      type: IsarType.string,
    ),
    r'serial': PropertySchema(
      id: 17,
      name: r'serial',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 18,
      name: r'status',
      type: IsarType.byte,
      enumMap: _PawnContractstatusEnumValueMap,
    ),
    r'totalInterest': PropertySchema(
      id: 19,
      name: r'totalInterest',
      type: IsarType.double,
    ),
    r'updatedAt': PropertySchema(
      id: 20,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _pawnContractEstimateSize,
  serialize: _pawnContractSerialize,
  deserialize: _pawnContractDeserialize,
  deserializeProp: _pawnContractDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customer': LinkSchema(
      id: -171103991706745908,
      name: r'customer',
      target: r'Customer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _pawnContractGetId,
  getLinks: _pawnContractGetLinks,
  attach: _pawnContractAttach,
  version: '3.1.0+1',
);

int _pawnContractEstimateSize(
  PawnContract object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assetImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cccdImageBack;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cccdImageFront;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cccdNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contractNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imei;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.portraitImage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serial;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pawnContractSerialize(
  PawnContract object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assetImage);
  writer.writeDouble(offsets[1], object.assetValue);
  writer.writeString(offsets[2], object.cccdImageBack);
  writer.writeString(offsets[3], object.cccdImageFront);
  writer.writeString(offsets[4], object.cccdNumber);
  writer.writeString(offsets[5], object.contractNumber);
  writer.writeDateTime(offsets[6], object.createdAt);
  writer.writeString(offsets[7], object.description);
  writer.writeDateTime(offsets[8], object.dueDate);
  writer.writeString(offsets[9], object.imei);
  writer.writeDouble(offsets[10], object.interestRate);
  writer.writeByte(offsets[11], object.interestType.index);
  writer.writeLong(offsets[12], object.numberOfDays);
  writer.writeDouble(offsets[13], object.paidInterest);
  writer.writeDouble(offsets[14], object.pawnAmount);
  writer.writeDateTime(offsets[15], object.pawnDate);
  writer.writeString(offsets[16], object.portraitImage);
  writer.writeString(offsets[17], object.serial);
  writer.writeByte(offsets[18], object.status.index);
  writer.writeDouble(offsets[19], object.totalInterest);
  writer.writeDateTime(offsets[20], object.updatedAt);
}

PawnContract _pawnContractDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PawnContract();
  object.assetImage = reader.readStringOrNull(offsets[0]);
  object.assetValue = reader.readDoubleOrNull(offsets[1]);
  object.cccdImageBack = reader.readStringOrNull(offsets[2]);
  object.cccdImageFront = reader.readStringOrNull(offsets[3]);
  object.cccdNumber = reader.readStringOrNull(offsets[4]);
  object.contractNumber = reader.readStringOrNull(offsets[5]);
  object.createdAt = reader.readDateTimeOrNull(offsets[6]);
  object.description = reader.readStringOrNull(offsets[7]);
  object.dueDate = reader.readDateTimeOrNull(offsets[8]);
  object.id = id;
  object.imei = reader.readStringOrNull(offsets[9]);
  object.interestRate = reader.readDoubleOrNull(offsets[10]);
  object.interestType = _PawnContractinterestTypeValueEnumMap[
          reader.readByteOrNull(offsets[11])] ??
      InterestType.daily;
  object.numberOfDays = reader.readLongOrNull(offsets[12]);
  object.paidInterest = reader.readDoubleOrNull(offsets[13]);
  object.pawnAmount = reader.readDoubleOrNull(offsets[14]);
  object.pawnDate = reader.readDateTimeOrNull(offsets[15]);
  object.portraitImage = reader.readStringOrNull(offsets[16]);
  object.serial = reader.readStringOrNull(offsets[17]);
  object.status =
      _PawnContractstatusValueEnumMap[reader.readByteOrNull(offsets[18])] ??
          PawnStatus.active;
  object.totalInterest = reader.readDoubleOrNull(offsets[19]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[20]);
  return object;
}

P _pawnContractDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (_PawnContractinterestTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          InterestType.daily) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (_PawnContractstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          PawnStatus.active) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    case 20:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PawnContractinterestTypeEnumValueMap = {
  'daily': 0,
  'monthly': 1,
  'yearly': 2,
  'fixedAmount': 3,
  'decliningBalance': 4,
};
const _PawnContractinterestTypeValueEnumMap = {
  0: InterestType.daily,
  1: InterestType.monthly,
  2: InterestType.yearly,
  3: InterestType.fixedAmount,
  4: InterestType.decliningBalance,
};
const _PawnContractstatusEnumValueMap = {
  'active': 0,
  'redeemed': 1,
  'liquidated': 2,
  'overdue': 3,
};
const _PawnContractstatusValueEnumMap = {
  0: PawnStatus.active,
  1: PawnStatus.redeemed,
  2: PawnStatus.liquidated,
  3: PawnStatus.overdue,
};

Id _pawnContractGetId(PawnContract object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pawnContractGetLinks(PawnContract object) {
  return [object.customer];
}

void _pawnContractAttach(
    IsarCollection<dynamic> col, Id id, PawnContract object) {
  object.id = id;
  object.customer.attach(col, col.isar.collection<Customer>(), r'customer', id);
}

extension PawnContractQueryWhereSort
    on QueryBuilder<PawnContract, PawnContract, QWhere> {
  QueryBuilder<PawnContract, PawnContract, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PawnContractQueryWhere
    on QueryBuilder<PawnContract, PawnContract, QWhereClause> {
  QueryBuilder<PawnContract, PawnContract, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PawnContract, PawnContract, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterWhereClause> idBetween(
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
}

extension PawnContractQueryFilter
    on QueryBuilder<PawnContract, PawnContract, QFilterCondition> {
  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assetImage',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assetImage',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetImage',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetImage',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assetValue',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assetValue',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetValueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetValueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetValueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetValue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      assetValueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccdImageBack',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccdImageBack',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccdImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccdImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccdImageBack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccdImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccdImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccdImageBack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccdImageBack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdImageBack',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageBackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccdImageBack',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccdImageFront',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccdImageFront',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccdImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccdImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccdImageFront',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccdImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccdImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccdImageFront',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccdImageFront',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdImageFront',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdImageFrontIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccdImageFront',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cccdNumber',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cccdNumber',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cccdNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cccdNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cccdNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cccdNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cccdNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cccdNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cccdNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cccdNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      cccdNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cccdNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractNumber',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractNumber',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      contractNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      dueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      imeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      imeiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imei',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      imeiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> imeiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imei',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      imeiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      imeiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestRateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'interestRate',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestRateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'interestRate',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestRateEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestRateGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestRateLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestRateBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestTypeEqualTo(InterestType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interestType',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestTypeGreaterThan(
    InterestType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interestType',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestTypeLessThan(
    InterestType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interestType',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      interestTypeBetween(
    InterestType lower,
    InterestType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interestType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      numberOfDaysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numberOfDays',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      numberOfDaysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numberOfDays',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      numberOfDaysEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfDays',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      numberOfDaysGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfDays',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      numberOfDaysLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfDays',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      numberOfDaysBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      paidInterestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'paidInterest',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      paidInterestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'paidInterest',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      paidInterestEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paidInterest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      paidInterestGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paidInterest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      paidInterestLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paidInterest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      paidInterestBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paidInterest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pawnAmount',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pawnAmount',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pawnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pawnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pawnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pawnAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pawnDate',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pawnDate',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pawnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pawnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pawnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      pawnDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pawnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portraitImage',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portraitImage',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portraitImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portraitImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portraitImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portraitImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portraitImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portraitImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portraitImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portraitImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portraitImage',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      portraitImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portraitImage',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serial',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> serialEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> serialBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> serialMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      serialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serial',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> statusEqualTo(
      PawnStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      statusGreaterThan(
    PawnStatus value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      statusLessThan(
    PawnStatus value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> statusBetween(
    PawnStatus lower,
    PawnStatus upper, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      totalInterestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalInterest',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      totalInterestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalInterest',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      totalInterestEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalInterest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      totalInterestGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalInterest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      totalInterestLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalInterest',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      totalInterestBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalInterest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

extension PawnContractQueryObject
    on QueryBuilder<PawnContract, PawnContract, QFilterCondition> {}

extension PawnContractQueryLinks
    on QueryBuilder<PawnContract, PawnContract, QFilterCondition> {
  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition> customer(
      FilterQuery<Customer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterFilterCondition>
      customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }
}

extension PawnContractQuerySortBy
    on QueryBuilder<PawnContract, PawnContract, QSortBy> {
  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByAssetImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetImage', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByAssetImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetImage', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByAssetValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetValue', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByAssetValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetValue', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByCccdImageBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageBack', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByCccdImageBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageBack', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByCccdImageFront() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageFront', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByCccdImageFrontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageFront', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByCccdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdNumber', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByCccdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdNumber', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByContractNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByContractNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByInterestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestType', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByInterestTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestType', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByNumberOfDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfDays', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByNumberOfDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfDays', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByPaidInterest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidInterest', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByPaidInterestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidInterest', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByPawnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnAmount', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByPawnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnAmount', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByPawnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnDate', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByPawnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnDate', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByPortraitImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portraitImage', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByPortraitImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portraitImage', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByTotalInterest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterest', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      sortByTotalInterestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterest', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension PawnContractQuerySortThenBy
    on QueryBuilder<PawnContract, PawnContract, QSortThenBy> {
  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByAssetImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetImage', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByAssetImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetImage', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByAssetValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetValue', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByAssetValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetValue', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByCccdImageBack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageBack', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByCccdImageBackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageBack', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByCccdImageFront() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageFront', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByCccdImageFrontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdImageFront', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByCccdNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdNumber', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByCccdNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cccdNumber', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByContractNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByContractNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractNumber', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByInterestRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestRate', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByInterestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestType', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByInterestTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interestType', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByNumberOfDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfDays', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByNumberOfDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfDays', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByPaidInterest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidInterest', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByPaidInterestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paidInterest', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByPawnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnAmount', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByPawnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnAmount', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByPawnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnDate', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByPawnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pawnDate', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByPortraitImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portraitImage', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByPortraitImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'portraitImage', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenBySerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenBySerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serial', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByTotalInterest() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterest', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy>
      thenByTotalInterestDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInterest', Sort.desc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension PawnContractQueryWhereDistinct
    on QueryBuilder<PawnContract, PawnContract, QDistinct> {
  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByAssetImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByAssetValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetValue');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByCccdImageBack(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccdImageBack',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByCccdImageFront(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccdImageFront',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByCccdNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cccdNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByContractNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByImei(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imei', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByInterestRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestRate');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByInterestType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interestType');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByNumberOfDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberOfDays');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByPaidInterest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paidInterest');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByPawnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pawnAmount');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByPawnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pawnDate');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByPortraitImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'portraitImage',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctBySerial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serial', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct>
      distinctByTotalInterest() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalInterest');
    });
  }

  QueryBuilder<PawnContract, PawnContract, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension PawnContractQueryProperty
    on QueryBuilder<PawnContract, PawnContract, QQueryProperty> {
  QueryBuilder<PawnContract, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations> assetImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetImage');
    });
  }

  QueryBuilder<PawnContract, double?, QQueryOperations> assetValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetValue');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations>
      cccdImageBackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccdImageBack');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations>
      cccdImageFrontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccdImageFront');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations> cccdNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cccdNumber');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations>
      contractNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractNumber');
    });
  }

  QueryBuilder<PawnContract, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<PawnContract, DateTime?, QQueryOperations> dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations> imeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imei');
    });
  }

  QueryBuilder<PawnContract, double?, QQueryOperations> interestRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestRate');
    });
  }

  QueryBuilder<PawnContract, InterestType, QQueryOperations>
      interestTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interestType');
    });
  }

  QueryBuilder<PawnContract, int?, QQueryOperations> numberOfDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberOfDays');
    });
  }

  QueryBuilder<PawnContract, double?, QQueryOperations> paidInterestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paidInterest');
    });
  }

  QueryBuilder<PawnContract, double?, QQueryOperations> pawnAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pawnAmount');
    });
  }

  QueryBuilder<PawnContract, DateTime?, QQueryOperations> pawnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pawnDate');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations>
      portraitImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portraitImage');
    });
  }

  QueryBuilder<PawnContract, String?, QQueryOperations> serialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serial');
    });
  }

  QueryBuilder<PawnContract, PawnStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PawnContract, double?, QQueryOperations>
      totalInterestProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalInterest');
    });
  }

  QueryBuilder<PawnContract, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
