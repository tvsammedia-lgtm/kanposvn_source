// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhathuoc_prescription.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocPrescriptionTemplateCollection on Isar {
  IsarCollection<NhathuocPrescriptionTemplate>
      get nhathuocPrescriptionTemplates => this.collection();
}

const NhathuocPrescriptionTemplateSchema = CollectionSchema(
  name: r'NhathuocPrescriptionTemplate',
  id: 6451451531811350586,
  properties: {
    r'diseaseName': PropertySchema(
      id: 0,
      name: r'diseaseName',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 1,
      name: r'notes',
      type: IsarType.string,
    ),
    r'templateId': PropertySchema(
      id: 2,
      name: r'templateId',
      type: IsarType.string,
    )
  },
  estimateSize: _nhathuocPrescriptionTemplateEstimateSize,
  serialize: _nhathuocPrescriptionTemplateSerialize,
  deserialize: _nhathuocPrescriptionTemplateDeserialize,
  deserializeProp: _nhathuocPrescriptionTemplateDeserializeProp,
  idName: r'id',
  indexes: {
    r'templateId': IndexSchema(
      id: -5352721467389445085,
      name: r'templateId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'templateId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'details': LinkSchema(
      id: 4130479947482184466,
      name: r'details',
      target: r'NhathuocPrescriptionTemplateDetail',
      single: false,
      linkName: r'template',
    )
  },
  embeddedSchemas: {},
  getId: _nhathuocPrescriptionTemplateGetId,
  getLinks: _nhathuocPrescriptionTemplateGetLinks,
  attach: _nhathuocPrescriptionTemplateAttach,
  version: '3.1.0+1',
);

int _nhathuocPrescriptionTemplateEstimateSize(
  NhathuocPrescriptionTemplate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.diseaseName.length * 3;
  bytesCount += 3 + object.notes.length * 3;
  bytesCount += 3 + object.templateId.length * 3;
  return bytesCount;
}

void _nhathuocPrescriptionTemplateSerialize(
  NhathuocPrescriptionTemplate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.diseaseName);
  writer.writeString(offsets[1], object.notes);
  writer.writeString(offsets[2], object.templateId);
}

NhathuocPrescriptionTemplate _nhathuocPrescriptionTemplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocPrescriptionTemplate();
  object.diseaseName = reader.readString(offsets[0]);
  object.id = id;
  object.notes = reader.readString(offsets[1]);
  object.templateId = reader.readString(offsets[2]);
  return object;
}

P _nhathuocPrescriptionTemplateDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocPrescriptionTemplateGetId(NhathuocPrescriptionTemplate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocPrescriptionTemplateGetLinks(
    NhathuocPrescriptionTemplate object) {
  return [object.details];
}

void _nhathuocPrescriptionTemplateAttach(
    IsarCollection<dynamic> col, Id id, NhathuocPrescriptionTemplate object) {
  object.id = id;
  object.details.attach(
      col,
      col.isar.collection<NhathuocPrescriptionTemplateDetail>(),
      r'details',
      id);
}

extension NhathuocPrescriptionTemplateByIndex
    on IsarCollection<NhathuocPrescriptionTemplate> {
  Future<NhathuocPrescriptionTemplate?> getByTemplateId(String templateId) {
    return getByIndex(r'templateId', [templateId]);
  }

  NhathuocPrescriptionTemplate? getByTemplateIdSync(String templateId) {
    return getByIndexSync(r'templateId', [templateId]);
  }

  Future<bool> deleteByTemplateId(String templateId) {
    return deleteByIndex(r'templateId', [templateId]);
  }

  bool deleteByTemplateIdSync(String templateId) {
    return deleteByIndexSync(r'templateId', [templateId]);
  }

  Future<List<NhathuocPrescriptionTemplate?>> getAllByTemplateId(
      List<String> templateIdValues) {
    final values = templateIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'templateId', values);
  }

  List<NhathuocPrescriptionTemplate?> getAllByTemplateIdSync(
      List<String> templateIdValues) {
    final values = templateIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'templateId', values);
  }

  Future<int> deleteAllByTemplateId(List<String> templateIdValues) {
    final values = templateIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'templateId', values);
  }

  int deleteAllByTemplateIdSync(List<String> templateIdValues) {
    final values = templateIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'templateId', values);
  }

  Future<Id> putByTemplateId(NhathuocPrescriptionTemplate object) {
    return putByIndex(r'templateId', object);
  }

  Id putByTemplateIdSync(NhathuocPrescriptionTemplate object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'templateId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTemplateId(
      List<NhathuocPrescriptionTemplate> objects) {
    return putAllByIndex(r'templateId', objects);
  }

  List<Id> putAllByTemplateIdSync(List<NhathuocPrescriptionTemplate> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'templateId', objects, saveLinks: saveLinks);
  }
}

extension NhathuocPrescriptionTemplateQueryWhereSort on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QWhere> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocPrescriptionTemplateQueryWhere on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QWhereClause> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> templateIdEqualTo(String templateId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'templateId',
        value: [templateId],
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterWhereClause> templateIdNotEqualTo(String templateId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'templateId',
              lower: [],
              upper: [templateId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'templateId',
              lower: [templateId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'templateId',
              lower: [templateId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'templateId',
              lower: [],
              upper: [templateId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NhathuocPrescriptionTemplateQueryFilter on QueryBuilder<
    NhathuocPrescriptionTemplate,
    NhathuocPrescriptionTemplate,
    QFilterCondition> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diseaseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      diseaseNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'diseaseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      diseaseNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'diseaseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diseaseName',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> diseaseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'diseaseName',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'templateId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      templateIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'templateId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      templateIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'templateId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'templateId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> templateIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'templateId',
        value: '',
      ));
    });
  }
}

extension NhathuocPrescriptionTemplateQueryObject on QueryBuilder<
    NhathuocPrescriptionTemplate,
    NhathuocPrescriptionTemplate,
    QFilterCondition> {}

extension NhathuocPrescriptionTemplateQueryLinks on QueryBuilder<
    NhathuocPrescriptionTemplate,
    NhathuocPrescriptionTemplate,
    QFilterCondition> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      details(FilterQuery<NhathuocPrescriptionTemplateDetail> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'details');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> detailsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, true, length, true);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> detailsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, 0, true);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> detailsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, false, 999999, true);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> detailsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', 0, true, length, include);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> detailsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'details', length, include, 999999, true);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> detailsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'details', lower, includeLower, upper, includeUpper);
    });
  }
}

extension NhathuocPrescriptionTemplateQuerySortBy on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QSortBy> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByDiseaseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByDiseaseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }
}

extension NhathuocPrescriptionTemplateQuerySortThenBy on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QSortThenBy> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByDiseaseName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByDiseaseNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diseaseName', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByTemplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByTemplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'templateId', Sort.desc);
    });
  }
}

extension NhathuocPrescriptionTemplateQueryWhereDistinct on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QDistinct> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByDiseaseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diseaseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByTemplateId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'templateId', caseSensitive: caseSensitive);
    });
  }
}

extension NhathuocPrescriptionTemplateQueryProperty on QueryBuilder<
    NhathuocPrescriptionTemplate,
    NhathuocPrescriptionTemplate,
    QQueryProperty> {
  QueryBuilder<NhathuocPrescriptionTemplate, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, String, QQueryOperations>
      diseaseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diseaseName');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, String, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, String, QQueryOperations>
      templateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'templateId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocPrescriptionTemplateDetailCollection on Isar {
  IsarCollection<NhathuocPrescriptionTemplateDetail>
      get nhathuocPrescriptionTemplateDetails => this.collection();
}

const NhathuocPrescriptionTemplateDetailSchema = CollectionSchema(
  name: r'NhathuocPrescriptionTemplateDetail',
  id: -8506696271462719039,
  properties: {
    r'defaultQuantity': PropertySchema(
      id: 0,
      name: r'defaultQuantity',
      type: IsarType.double,
    ),
    r'dosageInstructions': PropertySchema(
      id: 1,
      name: r'dosageInstructions',
      type: IsarType.string,
    )
  },
  estimateSize: _nhathuocPrescriptionTemplateDetailEstimateSize,
  serialize: _nhathuocPrescriptionTemplateDetailSerialize,
  deserialize: _nhathuocPrescriptionTemplateDetailDeserialize,
  deserializeProp: _nhathuocPrescriptionTemplateDetailDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'template': LinkSchema(
      id: -282198164897133371,
      name: r'template',
      target: r'NhathuocPrescriptionTemplate',
      single: true,
    ),
    r'medicine': LinkSchema(
      id: 1215729424343854405,
      name: r'medicine',
      target: r'NhathuocMedicine',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _nhathuocPrescriptionTemplateDetailGetId,
  getLinks: _nhathuocPrescriptionTemplateDetailGetLinks,
  attach: _nhathuocPrescriptionTemplateDetailAttach,
  version: '3.1.0+1',
);

int _nhathuocPrescriptionTemplateDetailEstimateSize(
  NhathuocPrescriptionTemplateDetail object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dosageInstructions.length * 3;
  return bytesCount;
}

void _nhathuocPrescriptionTemplateDetailSerialize(
  NhathuocPrescriptionTemplateDetail object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.defaultQuantity);
  writer.writeString(offsets[1], object.dosageInstructions);
}

NhathuocPrescriptionTemplateDetail
    _nhathuocPrescriptionTemplateDetailDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocPrescriptionTemplateDetail();
  object.defaultQuantity = reader.readDouble(offsets[0]);
  object.dosageInstructions = reader.readString(offsets[1]);
  object.id = id;
  return object;
}

P _nhathuocPrescriptionTemplateDetailDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nhathuocPrescriptionTemplateDetailGetId(
    NhathuocPrescriptionTemplateDetail object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocPrescriptionTemplateDetailGetLinks(
    NhathuocPrescriptionTemplateDetail object) {
  return [object.template, object.medicine];
}

void _nhathuocPrescriptionTemplateDetailAttach(IsarCollection<dynamic> col,
    Id id, NhathuocPrescriptionTemplateDetail object) {
  object.id = id;
  object.template.attach(col,
      col.isar.collection<NhathuocPrescriptionTemplate>(), r'template', id);
  object.medicine
      .attach(col, col.isar.collection<NhathuocMedicine>(), r'medicine', id);
}

extension NhathuocPrescriptionTemplateDetailQueryWhereSort on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QWhere> {
  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocPrescriptionTemplateDetailQueryWhere on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QWhereClause> {
  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterWhereClause> idBetween(
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

extension NhathuocPrescriptionTemplateDetailQueryFilter on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QFilterCondition> {
  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> defaultQuantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defaultQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> defaultQuantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defaultQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> defaultQuantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defaultQuantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> defaultQuantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defaultQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosageInstructions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
          NhathuocPrescriptionTemplateDetail, QAfterFilterCondition>
      dosageInstructionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosageInstructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
          NhathuocPrescriptionTemplateDetail, QAfterFilterCondition>
      dosageInstructionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosageInstructions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> dosageInstructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosageInstructions',
        value: '',
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterFilterCondition> idBetween(
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

extension NhathuocPrescriptionTemplateDetailQueryObject on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QFilterCondition> {}

extension NhathuocPrescriptionTemplateDetailQueryLinks on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QFilterCondition> {
  QueryBuilder<NhathuocPrescriptionTemplateDetail,
          NhathuocPrescriptionTemplateDetail, QAfterFilterCondition>
      template(FilterQuery<NhathuocPrescriptionTemplate> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'template');
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> templateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'template', 0, true, 0, true);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> medicine(FilterQuery<NhathuocMedicine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'medicine');
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> medicineIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'medicine', 0, true, 0, true);
    });
  }
}

extension NhathuocPrescriptionTemplateDetailQuerySortBy on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QSortBy> {
  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> sortByDefaultQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultQuantity', Sort.asc);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> sortByDefaultQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultQuantity', Sort.desc);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> sortByDosageInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.asc);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> sortByDosageInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.desc);
    });
  }
}

extension NhathuocPrescriptionTemplateDetailQuerySortThenBy on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QSortThenBy> {
  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> thenByDefaultQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultQuantity', Sort.asc);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> thenByDefaultQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultQuantity', Sort.desc);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> thenByDosageInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.asc);
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterSortBy> thenByDosageInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageInstructions', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension NhathuocPrescriptionTemplateDetailQueryWhereDistinct on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QDistinct> {
  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QDistinct> distinctByDefaultQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultQuantity');
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QDistinct> distinctByDosageInstructions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosageInstructions',
          caseSensitive: caseSensitive);
    });
  }
}

extension NhathuocPrescriptionTemplateDetailQueryProperty on QueryBuilder<
    NhathuocPrescriptionTemplateDetail,
    NhathuocPrescriptionTemplateDetail,
    QQueryProperty> {
  QueryBuilder<NhathuocPrescriptionTemplateDetail, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, double, QQueryOperations>
      defaultQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultQuantity');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, String, QQueryOperations>
      dosageInstructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosageInstructions');
    });
  }
}
