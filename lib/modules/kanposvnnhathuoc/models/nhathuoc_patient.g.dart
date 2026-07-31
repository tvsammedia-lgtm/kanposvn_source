// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhathuoc_patient.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocPatientCollection on Isar {
  IsarCollection<NhathuocPatient> get nhathuocPatients => this.collection();
}

const NhathuocPatientSchema = CollectionSchema(
  name: r'NhathuocPatient',
  id: 6146379150581956845,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'allergies': PropertySchema(
      id: 1,
      name: r'allergies',
      type: IsarType.string,
    ),
    r'currentDebt': PropertySchema(
      id: 2,
      name: r'currentDebt',
      type: IsarType.double,
    ),
    r'medicalHistory': PropertySchema(
      id: 3,
      name: r'medicalHistory',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'patientId': PropertySchema(
      id: 5,
      name: r'patientId',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 6,
      name: r'phone',
      type: IsarType.string,
    ),
    r'rewardPoints': PropertySchema(
      id: 7,
      name: r'rewardPoints',
      type: IsarType.long,
    )
  },
  estimateSize: _nhathuocPatientEstimateSize,
  serialize: _nhathuocPatientSerialize,
  deserialize: _nhathuocPatientDeserialize,
  deserializeProp: _nhathuocPatientDeserializeProp,
  idName: r'id',
  indexes: {
    r'patientId': IndexSchema(
      id: 403389457658259617,
      name: r'patientId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'patientId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nhathuocPatientGetId,
  getLinks: _nhathuocPatientGetLinks,
  attach: _nhathuocPatientAttach,
  version: '3.1.0+1',
);

int _nhathuocPatientEstimateSize(
  NhathuocPatient object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.allergies.length * 3;
  bytesCount += 3 + object.medicalHistory.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.patientId.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  return bytesCount;
}

void _nhathuocPatientSerialize(
  NhathuocPatient object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.allergies);
  writer.writeDouble(offsets[2], object.currentDebt);
  writer.writeString(offsets[3], object.medicalHistory);
  writer.writeString(offsets[4], object.name);
  writer.writeString(offsets[5], object.patientId);
  writer.writeString(offsets[6], object.phone);
  writer.writeLong(offsets[7], object.rewardPoints);
}

NhathuocPatient _nhathuocPatientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocPatient();
  object.address = reader.readString(offsets[0]);
  object.allergies = reader.readString(offsets[1]);
  object.currentDebt = reader.readDouble(offsets[2]);
  object.id = id;
  object.medicalHistory = reader.readString(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.patientId = reader.readString(offsets[5]);
  object.phone = reader.readString(offsets[6]);
  object.rewardPoints = reader.readLong(offsets[7]);
  return object;
}

P _nhathuocPatientDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocPatientGetId(NhathuocPatient object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocPatientGetLinks(NhathuocPatient object) {
  return [];
}

void _nhathuocPatientAttach(
    IsarCollection<dynamic> col, Id id, NhathuocPatient object) {
  object.id = id;
}

extension NhathuocPatientByIndex on IsarCollection<NhathuocPatient> {
  Future<NhathuocPatient?> getByPatientId(String patientId) {
    return getByIndex(r'patientId', [patientId]);
  }

  NhathuocPatient? getByPatientIdSync(String patientId) {
    return getByIndexSync(r'patientId', [patientId]);
  }

  Future<bool> deleteByPatientId(String patientId) {
    return deleteByIndex(r'patientId', [patientId]);
  }

  bool deleteByPatientIdSync(String patientId) {
    return deleteByIndexSync(r'patientId', [patientId]);
  }

  Future<List<NhathuocPatient?>> getAllByPatientId(
      List<String> patientIdValues) {
    final values = patientIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'patientId', values);
  }

  List<NhathuocPatient?> getAllByPatientIdSync(List<String> patientIdValues) {
    final values = patientIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'patientId', values);
  }

  Future<int> deleteAllByPatientId(List<String> patientIdValues) {
    final values = patientIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'patientId', values);
  }

  int deleteAllByPatientIdSync(List<String> patientIdValues) {
    final values = patientIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'patientId', values);
  }

  Future<Id> putByPatientId(NhathuocPatient object) {
    return putByIndex(r'patientId', object);
  }

  Id putByPatientIdSync(NhathuocPatient object, {bool saveLinks = true}) {
    return putByIndexSync(r'patientId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPatientId(List<NhathuocPatient> objects) {
    return putAllByIndex(r'patientId', objects);
  }

  List<Id> putAllByPatientIdSync(List<NhathuocPatient> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'patientId', objects, saveLinks: saveLinks);
  }
}

extension NhathuocPatientQueryWhereSort
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QWhere> {
  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocPatientQueryWhere
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QWhereClause> {
  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause>
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause> idBetween(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause>
      patientIdEqualTo(String patientId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'patientId',
        value: [patientId],
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterWhereClause>
      patientIdNotEqualTo(String patientId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [patientId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'patientId',
              lower: [],
              upper: [patientId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NhathuocPatientQueryFilter
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QFilterCondition> {
  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allergies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allergies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allergies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allergies',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'allergies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'allergies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'allergies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'allergies',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allergies',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      allergiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'allergies',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      currentDebtEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      currentDebtGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      currentDebtLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentDebt',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      currentDebtBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentDebt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicalHistory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicalHistory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicalHistory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicalHistory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicalHistory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicalHistory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicalHistory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicalHistory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicalHistory',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      medicalHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicalHistory',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'patientId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'patientId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'patientId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'patientId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      patientIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'patientId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneEqualTo(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneGreaterThan(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneLessThan(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneBetween(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneStartsWith(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneEndsWith(
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

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      rewardPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rewardPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      rewardPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rewardPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      rewardPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rewardPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterFilterCondition>
      rewardPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rewardPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NhathuocPatientQueryObject
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QFilterCondition> {}

extension NhathuocPatientQueryLinks
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QFilterCondition> {}

extension NhathuocPatientQuerySortBy
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QSortBy> {
  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByAllergies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByAllergiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByCurrentDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByMedicalHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalHistory', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByMedicalHistoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalHistory', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByRewardPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      sortByRewardPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.desc);
    });
  }
}

extension NhathuocPatientQuerySortThenBy
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QSortThenBy> {
  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByAllergies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByAllergiesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allergies', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByCurrentDebtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDebt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByMedicalHistory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalHistory', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByMedicalHistoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicalHistory', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByPatientId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByPatientIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'patientId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByRewardPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QAfterSortBy>
      thenByRewardPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rewardPoints', Sort.desc);
    });
  }
}

extension NhathuocPatientQueryWhereDistinct
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct> {
  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct> distinctByAllergies(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allergies', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct>
      distinctByCurrentDebt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentDebt');
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct>
      distinctByMedicalHistory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicalHistory',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct> distinctByPatientId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'patientId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPatient, NhathuocPatient, QDistinct>
      distinctByRewardPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rewardPoints');
    });
  }
}

extension NhathuocPatientQueryProperty
    on QueryBuilder<NhathuocPatient, NhathuocPatient, QQueryProperty> {
  QueryBuilder<NhathuocPatient, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocPatient, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<NhathuocPatient, String, QQueryOperations> allergiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allergies');
    });
  }

  QueryBuilder<NhathuocPatient, double, QQueryOperations>
      currentDebtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentDebt');
    });
  }

  QueryBuilder<NhathuocPatient, String, QQueryOperations>
      medicalHistoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicalHistory');
    });
  }

  QueryBuilder<NhathuocPatient, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<NhathuocPatient, String, QQueryOperations> patientIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'patientId');
    });
  }

  QueryBuilder<NhathuocPatient, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<NhathuocPatient, int, QQueryOperations> rewardPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rewardPoints');
    });
  }
}
