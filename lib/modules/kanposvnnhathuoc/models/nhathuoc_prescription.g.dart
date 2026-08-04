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
    r'deletedAt': PropertySchema(
      id: 0,
      name: r'deletedAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 1,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'diseaseName': PropertySchema(
      id: 2,
      name: r'diseaseName',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    ),
    r'templateId': PropertySchema(
      id: 5,
      name: r'templateId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 7,
      name: r'version',
      type: IsarType.long,
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
  bytesCount += 3 + object.deviceId.length * 3;
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
  writer.writeDateTime(offsets[0], object.deletedAt);
  writer.writeString(offsets[1], object.deviceId);
  writer.writeString(offsets[2], object.diseaseName);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.notes);
  writer.writeString(offsets[5], object.templateId);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeLong(offsets[7], object.version);
}

NhathuocPrescriptionTemplate _nhathuocPrescriptionTemplateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocPrescriptionTemplate();
  object.deletedAt = reader.readDateTimeOrNull(offsets[0]);
  object.deviceId = reader.readString(offsets[1]);
  object.diseaseName = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.notes = reader.readString(offsets[4]);
  object.templateId = reader.readString(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  object.version = reader.readLong(offsets[7]);
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
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
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
          QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
      ));
    });
  }

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
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterFilterCondition> versionBetween(
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
      QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

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
      QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension NhathuocPrescriptionTemplateQuerySortThenBy on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QSortThenBy> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

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
      QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension NhathuocPrescriptionTemplateQueryWhereDistinct on QueryBuilder<
    NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate, QDistinct> {
  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByDiseaseName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diseaseName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
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

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, NhathuocPrescriptionTemplate,
      QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
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

  QueryBuilder<NhathuocPrescriptionTemplate, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, String, QQueryOperations>
      diseaseNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diseaseName');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
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

  QueryBuilder<NhathuocPrescriptionTemplate, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplate, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
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
    r'dosageInstructions': PropertySchema(
      id: 3,
      name: r'dosageInstructions',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 4,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'version': PropertySchema(
      id: 6,
      name: r'version',
      type: IsarType.long,
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
  bytesCount += 3 + object.deviceId.length * 3;
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
  writer.writeDateTime(offsets[1], object.deletedAt);
  writer.writeString(offsets[2], object.deviceId);
  writer.writeString(offsets[3], object.dosageInstructions);
  writer.writeBool(offsets[4], object.isSynced);
  writer.writeDateTime(offsets[5], object.updatedAt);
  writer.writeLong(offsets[6], object.version);
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
  object.deletedAt = reader.readDateTimeOrNull(offsets[1]);
  object.deviceId = reader.readString(offsets[2]);
  object.dosageInstructions = reader.readString(offsets[3]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[4]);
  object.updatedAt = reader.readDateTime(offsets[5]);
  object.version = reader.readLong(offsets[6]);
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
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
      QAfterFilterCondition> deletedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deletedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deletedAt',
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deletedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deletedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deletedAtGreaterThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deletedAtLessThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deletedAtBetween(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdEqualTo(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdGreaterThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdLessThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdBetween(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdStartsWith(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdEndsWith(
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
          NhathuocPrescriptionTemplateDetail, QAfterFilterCondition>
      deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
          NhathuocPrescriptionTemplateDetail, QAfterFilterCondition>
      deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceId',
        value: '',
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceId',
        value: '',
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> versionGreaterThan(
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

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterFilterCondition> versionBetween(
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByDeletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deletedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QDistinct> distinctByDeletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deletedAt');
    });
  }

  QueryBuilder<
      NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail,
      QDistinct> distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail,
      NhathuocPrescriptionTemplateDetail, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
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

  QueryBuilder<NhathuocPrescriptionTemplateDetail, DateTime?, QQueryOperations>
      deletedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deletedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, String, QQueryOperations>
      deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, String, QQueryOperations>
      dosageInstructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosageInstructions');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<NhathuocPrescriptionTemplateDetail, int, QQueryOperations>
      versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
