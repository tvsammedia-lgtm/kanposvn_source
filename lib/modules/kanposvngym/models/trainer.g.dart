// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGymTrainerCollection on Isar {
  IsarCollection<GymTrainer> get gymTrainers => this.collection();
}

const GymTrainerSchema = CollectionSchema(
  name: r'GymTrainer',
  id: -5957465773370557063,
  properties: {
    r'commissionRate': PropertySchema(
      id: 0,
      name: r'commissionRate',
      type: IsarType.double,
    ),
    r'deletedAt': PropertySchema(
      id: 1,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'fullName': PropertySchema(
      id: 2,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'phone': PropertySchema(
      id: 4,
      name: r'phone',
      type: IsarType.string,
    ),
    r'salary': PropertySchema(
      id: 5,
      name: r'salary',
      type: IsarType.double,
    ),
    r'specialty': PropertySchema(
      id: 6,
      name: r'specialty',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    ),
    r'trainerId': PropertySchema(
      id: 8,
      name: r'trainerId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _gymTrainerEstimateSize,
  serialize: _gymTrainerSerialize,
  deserialize: _gymTrainerDeserialize,
  deserializeProp: _gymTrainerDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'trainerId': IndexSchema(
      id: -984084526825081920,
      name: r'trainerId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'trainerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _gymTrainerGetId,
  getLinks: _gymTrainerGetLinks,
  attach: _gymTrainerAttach,
  version: '3.1.0+1',
);

int _gymTrainerEstimateSize(
  GymTrainer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  bytesCount += 3 + object.specialty.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.trainerId.length * 3;
  return bytesCount;
}

void _gymTrainerSerialize(
  GymTrainer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.commissionRate);
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.fullName);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.phone);
  writer.writeDouble(offsets[5], object.salary);
  writer.writeString(offsets[6], object.specialty);
  writer.writeString(offsets[7], object.status);
  writer.writeString(offsets[8], object.trainerId);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

GymTrainer _gymTrainerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GymTrainer();
  object.commissionRate = reader.readDouble(offsets[0]);
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.fullName = reader.readString(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.isarId = id;
  object.phone = reader.readString(offsets[4]);
  object.salary = reader.readDouble(offsets[5]);
  object.specialty = reader.readString(offsets[6]);
  object.status = reader.readString(offsets[7]);
  object.trainerId = reader.readString(offsets[8]);
  object.updatedAt = reader.readDateTime(offsets[9]);
  return object;
}

P _gymTrainerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gymTrainerGetId(GymTrainer object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _gymTrainerGetLinks(GymTrainer object) {
  return [];
}

void _gymTrainerAttach(IsarCollection<dynamic> col, Id id, GymTrainer object) {
  object.isarId = id;
}

extension GymTrainerByIndex on IsarCollection<GymTrainer> {
  Future<GymTrainer?> getByTrainerId(String trainerId) {
    return getByIndex(r'trainerId', [trainerId]);
  }

  GymTrainer? getByTrainerIdSync(String trainerId) {
    return getByIndexSync(r'trainerId', [trainerId]);
  }

  Future<bool> deleteByTrainerId(String trainerId) {
    return deleteByIndex(r'trainerId', [trainerId]);
  }

  bool deleteByTrainerIdSync(String trainerId) {
    return deleteByIndexSync(r'trainerId', [trainerId]);
  }

  Future<List<GymTrainer?>> getAllByTrainerId(List<String> trainerIdValues) {
    final values = trainerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'trainerId', values);
  }

  List<GymTrainer?> getAllByTrainerIdSync(List<String> trainerIdValues) {
    final values = trainerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'trainerId', values);
  }

  Future<int> deleteAllByTrainerId(List<String> trainerIdValues) {
    final values = trainerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'trainerId', values);
  }

  int deleteAllByTrainerIdSync(List<String> trainerIdValues) {
    final values = trainerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'trainerId', values);
  }

  Future<Id> putByTrainerId(GymTrainer object) {
    return putByIndex(r'trainerId', object);
  }

  Id putByTrainerIdSync(GymTrainer object, {bool saveLinks = true}) {
    return putByIndexSync(r'trainerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTrainerId(List<GymTrainer> objects) {
    return putAllByIndex(r'trainerId', objects);
  }

  List<Id> putAllByTrainerIdSync(List<GymTrainer> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'trainerId', objects, saveLinks: saveLinks);
  }
}

extension GymTrainerQueryWhereSort
    on QueryBuilder<GymTrainer, GymTrainer, QWhere> {
  QueryBuilder<GymTrainer, GymTrainer, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GymTrainerQueryWhere
    on QueryBuilder<GymTrainer, GymTrainer, QWhereClause> {
  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> trainerIdEqualTo(
      String trainerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'trainerId',
        value: [trainerId],
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterWhereClause> trainerIdNotEqualTo(
      String trainerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trainerId',
              lower: [],
              upper: [trainerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trainerId',
              lower: [trainerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trainerId',
              lower: [trainerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'trainerId',
              lower: [],
              upper: [trainerId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GymTrainerQueryFilter
    on QueryBuilder<GymTrainer, GymTrainer, QFilterCondition> {
  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      commissionRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commissionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      commissionRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commissionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      commissionRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commissionRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      commissionRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commissionRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> deletedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> fullNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      fullNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> fullNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> fullNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> fullNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> fullNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneEqualTo(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneGreaterThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneLessThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneBetween(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneStartsWith(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneEndsWith(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> salaryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> salaryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> salaryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> salaryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> specialtyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      specialtyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> specialtyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> specialtyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'specialty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      specialtyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> specialtyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> specialtyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'specialty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> specialtyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'specialty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      specialtyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'specialty',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      specialtyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'specialty',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusEqualTo(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusBetween(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusStartsWith(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusEndsWith(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> trainerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      trainerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> trainerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> trainerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      trainerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> trainerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> trainerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> trainerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trainerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      trainerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainerId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
      trainerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trainerId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition>
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<GymTrainer, GymTrainer, QAfterFilterCondition> updatedAtBetween(
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

extension GymTrainerQueryObject
    on QueryBuilder<GymTrainer, GymTrainer, QFilterCondition> {}

extension GymTrainerQueryLinks
    on QueryBuilder<GymTrainer, GymTrainer, QFilterCondition> {}

extension GymTrainerQuerySortBy
    on QueryBuilder<GymTrainer, GymTrainer, QSortBy> {
  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByCommissionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commissionRate', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy>
      sortByCommissionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commissionRate', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortBySalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortBySalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortBySpecialty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortBySpecialtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByTrainerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByTrainerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GymTrainerQuerySortThenBy
    on QueryBuilder<GymTrainer, GymTrainer, QSortThenBy> {
  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByCommissionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commissionRate', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy>
      thenByCommissionRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commissionRate', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenBySalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenBySalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salary', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenBySpecialty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenBySpecialtyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'specialty', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByTrainerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByTrainerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.desc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GymTrainerQueryWhereDistinct
    on QueryBuilder<GymTrainer, GymTrainer, QDistinct> {
  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByCommissionRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commissionRate');
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctBySalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salary');
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctBySpecialty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'specialty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByTrainerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymTrainer, GymTrainer, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension GymTrainerQueryProperty
    on QueryBuilder<GymTrainer, GymTrainer, QQueryProperty> {
  QueryBuilder<GymTrainer, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GymTrainer, double, QQueryOperations> commissionRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commissionRate');
    });
  }

  QueryBuilder<GymTrainer, DateTime?, QQueryOperations> deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<GymTrainer, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<GymTrainer, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<GymTrainer, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<GymTrainer, double, QQueryOperations> salaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salary');
    });
  }

  QueryBuilder<GymTrainer, String, QQueryOperations> specialtyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'specialty');
    });
  }

  QueryBuilder<GymTrainer, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<GymTrainer, String, QQueryOperations> trainerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainerId');
    });
  }

  QueryBuilder<GymTrainer, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGymClassScheduleCollection on Isar {
  IsarCollection<GymClassSchedule> get gymClassSchedules => this.collection();
}

const GymClassScheduleSchema = CollectionSchema(
  name: r'GymClassSchedule',
  id: 4555523247454850919,
  properties: {
    r'classId': PropertySchema(
      id: 0,
      name: r'classId',
      type: IsarType.string,
    ),
    r'className': PropertySchema(
      id: 1,
      name: r'className',
      type: IsarType.string,
    ),
    r'endTime': PropertySchema(
      id: 2,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'maxCapacity': PropertySchema(
      id: 4,
      name: r'maxCapacity',
      type: IsarType.long,
    ),
    r'registeredCount': PropertySchema(
      id: 5,
      name: r'registeredCount',
      type: IsarType.long,
    ),
    r'startTime': PropertySchema(
      id: 6,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.string,
    ),
    r'trainerId': PropertySchema(
      id: 8,
      name: r'trainerId',
      type: IsarType.string,
    )
  },
  estimateSize: _gymClassScheduleEstimateSize,
  serialize: _gymClassScheduleSerialize,
  deserialize: _gymClassScheduleDeserialize,
  deserializeProp: _gymClassScheduleDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'classId': IndexSchema(
      id: 5352960816261817663,
      name: r'classId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'classId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _gymClassScheduleGetId,
  getLinks: _gymClassScheduleGetLinks,
  attach: _gymClassScheduleAttach,
  version: '3.1.0+1',
);

int _gymClassScheduleEstimateSize(
  GymClassSchedule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classId.length * 3;
  bytesCount += 3 + object.className.length * 3;
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.trainerId.length * 3;
  return bytesCount;
}

void _gymClassScheduleSerialize(
  GymClassSchedule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.classId);
  writer.writeString(offsets[1], object.className);
  writer.writeDateTime(offsets[2], object.endTime);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeLong(offsets[4], object.maxCapacity);
  writer.writeLong(offsets[5], object.registeredCount);
  writer.writeDateTime(offsets[6], object.startTime);
  writer.writeString(offsets[7], object.status);
  writer.writeString(offsets[8], object.trainerId);
}

GymClassSchedule _gymClassScheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GymClassSchedule();
  object.classId = reader.readString(offsets[0]);
  object.className = reader.readString(offsets[1]);
  object.endTime = reader.readDateTime(offsets[2]);
  object.isSynced = reader.readBool(offsets[3]);
  object.isarId = id;
  object.maxCapacity = reader.readLong(offsets[4]);
  object.registeredCount = reader.readLong(offsets[5]);
  object.startTime = reader.readDateTime(offsets[6]);
  object.status = reader.readString(offsets[7]);
  object.trainerId = reader.readString(offsets[8]);
  return object;
}

P _gymClassScheduleDeserializeProp<P>(
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
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gymClassScheduleGetId(GymClassSchedule object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _gymClassScheduleGetLinks(GymClassSchedule object) {
  return [];
}

void _gymClassScheduleAttach(
    IsarCollection<dynamic> col, Id id, GymClassSchedule object) {
  object.isarId = id;
}

extension GymClassScheduleByIndex on IsarCollection<GymClassSchedule> {
  Future<GymClassSchedule?> getByClassId(String classId) {
    return getByIndex(r'classId', [classId]);
  }

  GymClassSchedule? getByClassIdSync(String classId) {
    return getByIndexSync(r'classId', [classId]);
  }

  Future<bool> deleteByClassId(String classId) {
    return deleteByIndex(r'classId', [classId]);
  }

  bool deleteByClassIdSync(String classId) {
    return deleteByIndexSync(r'classId', [classId]);
  }

  Future<List<GymClassSchedule?>> getAllByClassId(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'classId', values);
  }

  List<GymClassSchedule?> getAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'classId', values);
  }

  Future<int> deleteAllByClassId(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'classId', values);
  }

  int deleteAllByClassIdSync(List<String> classIdValues) {
    final values = classIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'classId', values);
  }

  Future<Id> putByClassId(GymClassSchedule object) {
    return putByIndex(r'classId', object);
  }

  Id putByClassIdSync(GymClassSchedule object, {bool saveLinks = true}) {
    return putByIndexSync(r'classId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByClassId(List<GymClassSchedule> objects) {
    return putAllByIndex(r'classId', objects);
  }

  List<Id> putAllByClassIdSync(List<GymClassSchedule> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'classId', objects, saveLinks: saveLinks);
  }
}

extension GymClassScheduleQueryWhereSort
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QWhere> {
  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GymClassScheduleQueryWhere
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QWhereClause> {
  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
      isarIdBetween(
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
      classIdEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'classId',
        value: [classId],
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterWhereClause>
      classIdNotEqualTo(String classId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classId',
              lower: [],
              upper: [classId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classId',
              lower: [classId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classId',
              lower: [classId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classId',
              lower: [],
              upper: [classId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension GymClassScheduleQueryFilter
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QFilterCondition> {
  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'classId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'classId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'className',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'className',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'className',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'className',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      classNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'className',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      endTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      endTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      endTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      maxCapacityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxCapacity',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      maxCapacityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxCapacity',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      maxCapacityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxCapacity',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      maxCapacityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxCapacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      registeredCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'registeredCount',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      registeredCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'registeredCount',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      registeredCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'registeredCount',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      registeredCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'registeredCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
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

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'trainerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'trainerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'trainerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'trainerId',
        value: '',
      ));
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterFilterCondition>
      trainerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'trainerId',
        value: '',
      ));
    });
  }
}

extension GymClassScheduleQueryObject
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QFilterCondition> {}

extension GymClassScheduleQueryLinks
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QFilterCondition> {}

extension GymClassScheduleQuerySortBy
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QSortBy> {
  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByMaxCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCapacity', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByMaxCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCapacity', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByRegisteredCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredCount', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByRegisteredCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredCount', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByTrainerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      sortByTrainerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.desc);
    });
  }
}

extension GymClassScheduleQuerySortThenBy
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QSortThenBy> {
  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByClassId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByClassIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classId', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByMaxCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCapacity', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByMaxCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCapacity', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByRegisteredCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredCount', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByRegisteredCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'registeredCount', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByTrainerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.asc);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QAfterSortBy>
      thenByTrainerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trainerId', Sort.desc);
    });
  }
}

extension GymClassScheduleQueryWhereDistinct
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct> {
  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct> distinctByClassId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByClassName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'className', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByMaxCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxCapacity');
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByRegisteredCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'registeredCount');
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GymClassSchedule, GymClassSchedule, QDistinct>
      distinctByTrainerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trainerId', caseSensitive: caseSensitive);
    });
  }
}

extension GymClassScheduleQueryProperty
    on QueryBuilder<GymClassSchedule, GymClassSchedule, QQueryProperty> {
  QueryBuilder<GymClassSchedule, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<GymClassSchedule, String, QQueryOperations> classIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classId');
    });
  }

  QueryBuilder<GymClassSchedule, String, QQueryOperations> classNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'className');
    });
  }

  QueryBuilder<GymClassSchedule, DateTime, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<GymClassSchedule, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<GymClassSchedule, int, QQueryOperations> maxCapacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxCapacity');
    });
  }

  QueryBuilder<GymClassSchedule, int, QQueryOperations>
      registeredCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'registeredCount');
    });
  }

  QueryBuilder<GymClassSchedule, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<GymClassSchedule, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<GymClassSchedule, String, QQueryOperations> trainerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trainerId');
    });
  }
}
