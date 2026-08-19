// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pawn_repair_order.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPawnRepairOrderCollection on Isar {
  IsarCollection<PawnRepairOrder> get pawnRepairOrders => this.collection();
}

const PawnRepairOrderSchema = CollectionSchema(
  name: r'PawnRepairOrder',
  id: -266828656837347025,
  properties: {
    r'actualCost': PropertySchema(
      id: 0,
      name: r'actualCost',
      type: IsarType.double,
    ),
    r'completedDate': PropertySchema(
      id: 1,
      name: r'completedDate',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deliveredDate': PropertySchema(
      id: 3,
      name: r'deliveredDate',
      type: IsarType.dateTime,
    ),
    r'deviceModel': PropertySchema(
      id: 4,
      name: r'deviceModel',
      type: IsarType.string,
    ),
    r'estimatedCost': PropertySchema(
      id: 5,
      name: r'estimatedCost',
      type: IsarType.double,
    ),
    r'faultDescription': PropertySchema(
      id: 6,
      name: r'faultDescription',
      type: IsarType.string,
    ),
    r'imei': PropertySchema(
      id: 7,
      name: r'imei',
      type: IsarType.string,
    ),
    r'orderCode': PropertySchema(
      id: 8,
      name: r'orderCode',
      type: IsarType.string,
    ),
    r'receivedDate': PropertySchema(
      id: 9,
      name: r'receivedDate',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _PawnRepairOrderstatusEnumValueMap,
    ),
    r'technicianName': PropertySchema(
      id: 11,
      name: r'technicianName',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _pawnRepairOrderEstimateSize,
  serialize: _pawnRepairOrderSerialize,
  deserialize: _pawnRepairOrderDeserialize,
  deserializeProp: _pawnRepairOrderDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'customer': LinkSchema(
      id: 4541460181037050869,
      name: r'customer',
      target: r'Customer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _pawnRepairOrderGetId,
  getLinks: _pawnRepairOrderGetLinks,
  attach: _pawnRepairOrderAttach,
  version: '3.1.0+1',
);

int _pawnRepairOrderEstimateSize(
  PawnRepairOrder object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.deviceModel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.faultDescription;
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
    final value = object.orderCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.technicianName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _pawnRepairOrderSerialize(
  PawnRepairOrder object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.actualCost);
  writer.writeDateTime(offsets[1], object.completedDate);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeDateTime(offsets[3], object.deliveredDate);
  writer.writeString(offsets[4], object.deviceModel);
  writer.writeDouble(offsets[5], object.estimatedCost);
  writer.writeString(offsets[6], object.faultDescription);
  writer.writeString(offsets[7], object.imei);
  writer.writeString(offsets[8], object.orderCode);
  writer.writeDateTime(offsets[9], object.receivedDate);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeString(offsets[11], object.technicianName);
  writer.writeDateTime(offsets[12], object.updatedAt);
}

PawnRepairOrder _pawnRepairOrderDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PawnRepairOrder();
  object.actualCost = reader.readDoubleOrNull(offsets[0]);
  object.completedDate = reader.readDateTimeOrNull(offsets[1]);
  object.createdAt = reader.readDateTimeOrNull(offsets[2]);
  object.deliveredDate = reader.readDateTimeOrNull(offsets[3]);
  object.deviceModel = reader.readStringOrNull(offsets[4]);
  object.estimatedCost = reader.readDoubleOrNull(offsets[5]);
  object.faultDescription = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.imei = reader.readStringOrNull(offsets[7]);
  object.orderCode = reader.readStringOrNull(offsets[8]);
  object.receivedDate = reader.readDateTimeOrNull(offsets[9]);
  object.status =
      _PawnRepairOrderstatusValueEnumMap[reader.readByteOrNull(offsets[10])] ??
          RepairStatus.received;
  object.technicianName = reader.readStringOrNull(offsets[11]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[12]);
  return object;
}

P _pawnRepairOrderDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (_PawnRepairOrderstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          RepairStatus.received) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PawnRepairOrderstatusEnumValueMap = {
  'received': 0,
  'inProgress': 1,
  'completed': 2,
  'delivered': 3,
  'cancelled': 4,
};
const _PawnRepairOrderstatusValueEnumMap = {
  0: RepairStatus.received,
  1: RepairStatus.inProgress,
  2: RepairStatus.completed,
  3: RepairStatus.delivered,
  4: RepairStatus.cancelled,
};

Id _pawnRepairOrderGetId(PawnRepairOrder object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pawnRepairOrderGetLinks(PawnRepairOrder object) {
  return [object.customer];
}

void _pawnRepairOrderAttach(
    IsarCollection<dynamic> col, Id id, PawnRepairOrder object) {
  object.id = id;
  object.customer.attach(col, col.isar.collection<Customer>(), r'customer', id);
}

extension PawnRepairOrderQueryWhereSort
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QWhere> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PawnRepairOrderQueryWhere
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QWhereClause> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterWhereClause>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterWhereClause> idBetween(
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

extension PawnRepairOrderQueryFilter
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QFilterCondition> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      actualCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualCost',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      actualCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualCost',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      actualCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      actualCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      actualCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      actualCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      completedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedDate',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      completedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedDate',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      completedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      completedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      completedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      completedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deliveredDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deliveredDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveredDate',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deliveredDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deliveredDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deliveredDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveredDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deliveredDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveredDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deviceModel',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deviceModel',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceModel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceModel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceModel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceModel',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      deviceModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceModel',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      estimatedCostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedCost',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      estimatedCostIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedCost',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      estimatedCostEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      estimatedCostGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      estimatedCostLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      estimatedCostBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'faultDescription',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'faultDescription',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'faultDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'faultDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'faultDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'faultDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'faultDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'faultDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'faultDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'faultDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'faultDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      faultDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'faultDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imei',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiEqualTo(
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiLessThan(
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiBetween(
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiEndsWith(
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imei',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imei',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      imeiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imei',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'orderCode',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'orderCode',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'orderCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'orderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'orderCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'orderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      orderCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'orderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      receivedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receivedDate',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      receivedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receivedDate',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      receivedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receivedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      receivedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receivedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      receivedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receivedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      receivedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receivedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      statusEqualTo(RepairStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      statusGreaterThan(
    RepairStatus value, {
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      statusLessThan(
    RepairStatus value, {
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      statusBetween(
    RepairStatus lower,
    RepairStatus upper, {
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'technicianName',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'technicianName',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'technicianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'technicianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'technicianName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'technicianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'technicianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'technicianName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'technicianName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'technicianName',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      technicianNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'technicianName',
        value: '',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
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

extension PawnRepairOrderQueryObject
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QFilterCondition> {}

extension PawnRepairOrderQueryLinks
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QFilterCondition> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      customer(FilterQuery<Customer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'customer');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterFilterCondition>
      customerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'customer', 0, true, 0, true);
    });
  }
}

extension PawnRepairOrderQuerySortBy
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QSortBy> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByActualCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCost', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByActualCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCost', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByCompletedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDate', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByCompletedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDate', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByDeviceModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceModel', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByDeviceModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceModel', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByEstimatedCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByFaultDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faultDescription', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByFaultDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faultDescription', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy> sortByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByReceivedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedDate', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByReceivedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedDate', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByTechnicianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianName', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByTechnicianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianName', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension PawnRepairOrderQuerySortThenBy
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QSortThenBy> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByActualCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCost', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByActualCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualCost', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByCompletedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDate', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByCompletedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedDate', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByDeliveredDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveredDate', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByDeviceModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceModel', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByDeviceModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceModel', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByEstimatedCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedCost', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByFaultDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faultDescription', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByFaultDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faultDescription', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy> thenByImei() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByImeiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imei', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'orderCode', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByReceivedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedDate', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByReceivedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedDate', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByTechnicianName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianName', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByTechnicianNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'technicianName', Sort.desc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension PawnRepairOrderQueryWhereDistinct
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct> {
  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByActualCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualCost');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByCompletedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedDate');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByDeliveredDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveredDate');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByDeviceModel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceModel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByEstimatedCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedCost');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByFaultDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'faultDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct> distinctByImei(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imei', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct> distinctByOrderCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'orderCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByReceivedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receivedDate');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByTechnicianName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'technicianName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PawnRepairOrder, PawnRepairOrder, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension PawnRepairOrderQueryProperty
    on QueryBuilder<PawnRepairOrder, PawnRepairOrder, QQueryProperty> {
  QueryBuilder<PawnRepairOrder, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PawnRepairOrder, double?, QQueryOperations>
      actualCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualCost');
    });
  }

  QueryBuilder<PawnRepairOrder, DateTime?, QQueryOperations>
      completedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedDate');
    });
  }

  QueryBuilder<PawnRepairOrder, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PawnRepairOrder, DateTime?, QQueryOperations>
      deliveredDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveredDate');
    });
  }

  QueryBuilder<PawnRepairOrder, String?, QQueryOperations>
      deviceModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceModel');
    });
  }

  QueryBuilder<PawnRepairOrder, double?, QQueryOperations>
      estimatedCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedCost');
    });
  }

  QueryBuilder<PawnRepairOrder, String?, QQueryOperations>
      faultDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'faultDescription');
    });
  }

  QueryBuilder<PawnRepairOrder, String?, QQueryOperations> imeiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imei');
    });
  }

  QueryBuilder<PawnRepairOrder, String?, QQueryOperations> orderCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'orderCode');
    });
  }

  QueryBuilder<PawnRepairOrder, DateTime?, QQueryOperations>
      receivedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receivedDate');
    });
  }

  QueryBuilder<PawnRepairOrder, RepairStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<PawnRepairOrder, String?, QQueryOperations>
      technicianNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'technicianName');
    });
  }

  QueryBuilder<PawnRepairOrder, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
