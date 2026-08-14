// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_evaluation.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNgoaiNguAIAssessmentCollection on Isar {
  IsarCollection<NgoaiNguAIAssessment> get ngoaiNguAIAssessments =>
      this.collection();
}

const NgoaiNguAIAssessmentSchema = CollectionSchema(
  name: r'NgoaiNguAIAssessment',
  id: -496112989403750810,
  properties: {
    r'aiCorrectedText': PropertySchema(
      id: 0,
      name: r'aiCorrectedText',
      type: IsarType.string,
    ),
    r'assessedAt': PropertySchema(
      id: 1,
      name: r'assessedAt',
      type: IsarType.dateTime,
    ),
    r'feedback': PropertySchema(
      id: 2,
      name: r'feedback',
      type: IsarType.string,
    ),
    r'fluencyScore': PropertySchema(
      id: 3,
      name: r'fluencyScore',
      type: IsarType.double,
    ),
    r'grammarScore': PropertySchema(
      id: 4,
      name: r'grammarScore',
      type: IsarType.double,
    ),
    r'isDeleted': PropertySchema(
      id: 5,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'lessonUuid': PropertySchema(
      id: 6,
      name: r'lessonUuid',
      type: IsarType.string,
    ),
    r'originalText': PropertySchema(
      id: 7,
      name: r'originalText',
      type: IsarType.string,
    ),
    r'overallScore': PropertySchema(
      id: 8,
      name: r'overallScore',
      type: IsarType.double,
    ),
    r'pronunciationScore': PropertySchema(
      id: 9,
      name: r'pronunciationScore',
      type: IsarType.double,
    ),
    r'studentUuid': PropertySchema(
      id: 10,
      name: r'studentUuid',
      type: IsarType.string,
    ),
    r'syncVersion': PropertySchema(
      id: 11,
      name: r'syncVersion',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 12,
      name: r'type',
      type: IsarType.byte,
      enumMap: _NgoaiNguAIAssessmenttypeEnumValueMap,
    ),
    r'uuid': PropertySchema(
      id: 13,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'vocabularyScore': PropertySchema(
      id: 14,
      name: r'vocabularyScore',
      type: IsarType.double,
    ),
    r'weaknesses': PropertySchema(
      id: 15,
      name: r'weaknesses',
      type: IsarType.string,
    )
  },
  estimateSize: _ngoaiNguAIAssessmentEstimateSize,
  serialize: _ngoaiNguAIAssessmentSerialize,
  deserialize: _ngoaiNguAIAssessmentDeserialize,
  deserializeProp: _ngoaiNguAIAssessmentDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ngoaiNguAIAssessmentGetId,
  getLinks: _ngoaiNguAIAssessmentGetLinks,
  attach: _ngoaiNguAIAssessmentAttach,
  version: '3.1.0+1',
);

int _ngoaiNguAIAssessmentEstimateSize(
  NgoaiNguAIAssessment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aiCorrectedText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.feedback;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lessonUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.originalText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.studentUuid;
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
  {
    final value = object.weaknesses;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ngoaiNguAIAssessmentSerialize(
  NgoaiNguAIAssessment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aiCorrectedText);
  writer.writeDateTime(offsets[1], object.assessedAt);
  writer.writeString(offsets[2], object.feedback);
  writer.writeDouble(offsets[3], object.fluencyScore);
  writer.writeDouble(offsets[4], object.grammarScore);
  writer.writeBool(offsets[5], object.isDeleted);
  writer.writeString(offsets[6], object.lessonUuid);
  writer.writeString(offsets[7], object.originalText);
  writer.writeDouble(offsets[8], object.overallScore);
  writer.writeDouble(offsets[9], object.pronunciationScore);
  writer.writeString(offsets[10], object.studentUuid);
  writer.writeLong(offsets[11], object.syncVersion);
  writer.writeByte(offsets[12], object.type.index);
  writer.writeString(offsets[13], object.uuid);
  writer.writeDouble(offsets[14], object.vocabularyScore);
  writer.writeString(offsets[15], object.weaknesses);
}

NgoaiNguAIAssessment _ngoaiNguAIAssessmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NgoaiNguAIAssessment();
  object.aiCorrectedText = reader.readStringOrNull(offsets[0]);
  object.assessedAt = reader.readDateTimeOrNull(offsets[1]);
  object.feedback = reader.readStringOrNull(offsets[2]);
  object.fluencyScore = reader.readDoubleOrNull(offsets[3]);
  object.grammarScore = reader.readDoubleOrNull(offsets[4]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[5]);
  object.lessonUuid = reader.readStringOrNull(offsets[6]);
  object.originalText = reader.readStringOrNull(offsets[7]);
  object.overallScore = reader.readDoubleOrNull(offsets[8]);
  object.pronunciationScore = reader.readDoubleOrNull(offsets[9]);
  object.studentUuid = reader.readStringOrNull(offsets[10]);
  object.syncVersion = reader.readLong(offsets[11]);
  object.type = _NgoaiNguAIAssessmenttypeValueEnumMap[
          reader.readByteOrNull(offsets[12])] ??
      AIEvaluationType.speaking;
  object.uuid = reader.readStringOrNull(offsets[13]);
  object.vocabularyScore = reader.readDoubleOrNull(offsets[14]);
  object.weaknesses = reader.readStringOrNull(offsets[15]);
  return object;
}

P _ngoaiNguAIAssessmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (_NgoaiNguAIAssessmenttypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AIEvaluationType.speaking) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NgoaiNguAIAssessmenttypeEnumValueMap = {
  'speaking': 0,
  'writing': 1,
  'grammar': 2,
  'vocabulary': 3,
  'placementTest': 4,
};
const _NgoaiNguAIAssessmenttypeValueEnumMap = {
  0: AIEvaluationType.speaking,
  1: AIEvaluationType.writing,
  2: AIEvaluationType.grammar,
  3: AIEvaluationType.vocabulary,
  4: AIEvaluationType.placementTest,
};

Id _ngoaiNguAIAssessmentGetId(NgoaiNguAIAssessment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ngoaiNguAIAssessmentGetLinks(
    NgoaiNguAIAssessment object) {
  return [];
}

void _ngoaiNguAIAssessmentAttach(
    IsarCollection<dynamic> col, Id id, NgoaiNguAIAssessment object) {
  object.id = id;
}

extension NgoaiNguAIAssessmentByIndex on IsarCollection<NgoaiNguAIAssessment> {
  Future<NgoaiNguAIAssessment?> getByUuid(String? uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  NgoaiNguAIAssessment? getByUuidSync(String? uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String? uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String? uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<NgoaiNguAIAssessment?>> getAllByUuid(List<String?> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<NgoaiNguAIAssessment?> getAllByUuidSync(List<String?> uuidValues) {
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

  Future<Id> putByUuid(NgoaiNguAIAssessment object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(NgoaiNguAIAssessment object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<NgoaiNguAIAssessment> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<NgoaiNguAIAssessment> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension NgoaiNguAIAssessmentQueryWhereSort
    on QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QWhere> {
  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NgoaiNguAIAssessmentQueryWhere
    on QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QWhereClause> {
  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
      uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
      uuidEqualTo(String? uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterWhereClause>
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
}

extension NgoaiNguAIAssessmentQueryFilter on QueryBuilder<NgoaiNguAIAssessment,
    NgoaiNguAIAssessment, QFilterCondition> {
  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aiCorrectedText',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aiCorrectedText',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiCorrectedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aiCorrectedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aiCorrectedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aiCorrectedText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aiCorrectedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aiCorrectedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      aiCorrectedTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aiCorrectedText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      aiCorrectedTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aiCorrectedText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiCorrectedText',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> aiCorrectedTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aiCorrectedText',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> assessedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assessedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> assessedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assessedAt',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> assessedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> assessedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> assessedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> assessedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assessedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feedback',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedback',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      feedbackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedback',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      feedbackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedback',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> feedbackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedback',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> fluencyScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fluencyScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> fluencyScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fluencyScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> fluencyScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fluencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> fluencyScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fluencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> fluencyScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fluencyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> fluencyScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fluencyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> grammarScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grammarScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> grammarScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grammarScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> grammarScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> grammarScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> grammarScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grammarScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> grammarScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grammarScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lessonUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lessonUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lessonUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      lessonUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lessonUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      lessonUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lessonUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lessonUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> lessonUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lessonUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'originalText',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'originalText',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      originalTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'originalText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      originalTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'originalText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalText',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> originalTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'originalText',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> overallScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'overallScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> overallScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'overallScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> overallScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overallScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> overallScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overallScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> overallScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overallScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> overallScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overallScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> pronunciationScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pronunciationScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> pronunciationScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pronunciationScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> pronunciationScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pronunciationScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> pronunciationScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pronunciationScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> pronunciationScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pronunciationScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> pronunciationScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pronunciationScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'studentUuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'studentUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      studentUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'studentUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      studentUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'studentUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> studentUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'studentUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> syncVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> syncVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> syncVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> syncVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> typeEqualTo(AIEvaluationType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> typeGreaterThan(
    AIEvaluationType value, {
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> typeLessThan(
    AIEvaluationType value, {
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> typeBetween(
    AIEvaluationType lower,
    AIEvaluationType upper, {
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> vocabularyScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vocabularyScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> vocabularyScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vocabularyScore',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> vocabularyScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vocabularyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> vocabularyScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vocabularyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> vocabularyScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vocabularyScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> vocabularyScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vocabularyScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weaknesses',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weaknesses',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weaknesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weaknesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weaknesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weaknesses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'weaknesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'weaknesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      weaknessesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'weaknesses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
          QAfterFilterCondition>
      weaknessesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'weaknesses',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weaknesses',
        value: '',
      ));
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment,
      QAfterFilterCondition> weaknessesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'weaknesses',
        value: '',
      ));
    });
  }
}

extension NgoaiNguAIAssessmentQueryObject on QueryBuilder<NgoaiNguAIAssessment,
    NgoaiNguAIAssessment, QFilterCondition> {}

extension NgoaiNguAIAssessmentQueryLinks on QueryBuilder<NgoaiNguAIAssessment,
    NgoaiNguAIAssessment, QFilterCondition> {}

extension NgoaiNguAIAssessmentQuerySortBy
    on QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QSortBy> {
  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByAiCorrectedText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiCorrectedText', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByAiCorrectedTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiCorrectedText', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByAssessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByAssessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByFluencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fluencyScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByFluencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fluencyScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByGrammarScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByLessonUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByLessonUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByOriginalText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByOriginalTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByPronunciationScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronunciationScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByPronunciationScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronunciationScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByVocabularyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabularyScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByVocabularyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabularyScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByWeaknesses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaknesses', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      sortByWeaknessesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaknesses', Sort.desc);
    });
  }
}

extension NgoaiNguAIAssessmentQuerySortThenBy
    on QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QSortThenBy> {
  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByAiCorrectedText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiCorrectedText', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByAiCorrectedTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiCorrectedText', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByAssessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByAssessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByFeedback() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByFeedbackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedback', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByFluencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fluencyScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByFluencyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fluencyScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByGrammarScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grammarScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByLessonUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByLessonUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lessonUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByOriginalText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByOriginalTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalText', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByOverallScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overallScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByPronunciationScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronunciationScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByPronunciationScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pronunciationScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByStudentUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByStudentUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'studentUuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenBySyncVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncVersion', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByVocabularyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabularyScore', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByVocabularyScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vocabularyScore', Sort.desc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByWeaknesses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaknesses', Sort.asc);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QAfterSortBy>
      thenByWeaknessesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weaknesses', Sort.desc);
    });
  }
}

extension NgoaiNguAIAssessmentQueryWhereDistinct
    on QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct> {
  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByAiCorrectedText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiCorrectedText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByAssessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessedAt');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByFeedback({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedback', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByFluencyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fluencyScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByGrammarScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grammarScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByLessonUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lessonUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByOriginalText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByOverallScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overallScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByPronunciationScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pronunciationScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByStudentUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'studentUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctBySyncVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByVocabularyScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vocabularyScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, NgoaiNguAIAssessment, QDistinct>
      distinctByWeaknesses({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weaknesses', caseSensitive: caseSensitive);
    });
  }
}

extension NgoaiNguAIAssessmentQueryProperty on QueryBuilder<
    NgoaiNguAIAssessment, NgoaiNguAIAssessment, QQueryProperty> {
  QueryBuilder<NgoaiNguAIAssessment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations>
      aiCorrectedTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiCorrectedText');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, DateTime?, QQueryOperations>
      assessedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessedAt');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations>
      feedbackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedback');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, double?, QQueryOperations>
      fluencyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fluencyScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, double?, QQueryOperations>
      grammarScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grammarScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, bool, QQueryOperations>
      isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations>
      lessonUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lessonUuid');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations>
      originalTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalText');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, double?, QQueryOperations>
      overallScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overallScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, double?, QQueryOperations>
      pronunciationScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pronunciationScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations>
      studentUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'studentUuid');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, int, QQueryOperations>
      syncVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncVersion');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, AIEvaluationType, QQueryOperations>
      typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, double?, QQueryOperations>
      vocabularyScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vocabularyScore');
    });
  }

  QueryBuilder<NgoaiNguAIAssessment, String?, QQueryOperations>
      weaknessesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weaknesses');
    });
  }
}
