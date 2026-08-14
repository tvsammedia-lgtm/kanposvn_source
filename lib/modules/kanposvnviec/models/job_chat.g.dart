// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_chat.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJobChatCollection on Isar {
  IsarCollection<JobChat> get jobChats => this.collection();
}

const JobChatSchema = CollectionSchema(
  name: r'JobChat',
  id: 7146818701543458531,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'jobUuid': PropertySchema(
      id: 1,
      name: r'jobUuid',
      type: IsarType.string,
    ),
    r'message': PropertySchema(
      id: 2,
      name: r'message',
      type: IsarType.string,
    ),
    r'sender': PropertySchema(
      id: 3,
      name: r'sender',
      type: IsarType.string,
    )
  },
  estimateSize: _jobChatEstimateSize,
  serialize: _jobChatSerialize,
  deserialize: _jobChatDeserialize,
  deserializeProp: _jobChatDeserializeProp,
  idName: r'id',
  indexes: {
    r'jobUuid': IndexSchema(
      id: -6319954055815479519,
      name: r'jobUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'jobUuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _jobChatGetId,
  getLinks: _jobChatGetLinks,
  attach: _jobChatAttach,
  version: '3.1.0+1',
);

int _jobChatEstimateSize(
  JobChat object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.jobUuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.message;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _jobChatSerialize(
  JobChat object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.jobUuid);
  writer.writeString(offsets[2], object.message);
  writer.writeString(offsets[3], object.sender);
}

JobChat _jobChatDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = JobChat();
  object.createdAt = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.jobUuid = reader.readStringOrNull(offsets[1]);
  object.message = reader.readStringOrNull(offsets[2]);
  object.sender = reader.readStringOrNull(offsets[3]);
  return object;
}

P _jobChatDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobChatGetId(JobChat object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobChatGetLinks(JobChat object) {
  return [];
}

void _jobChatAttach(IsarCollection<dynamic> col, Id id, JobChat object) {
  object.id = id;
}

extension JobChatQueryWhereSort on QueryBuilder<JobChat, JobChat, QWhere> {
  QueryBuilder<JobChat, JobChat, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobChatQueryWhere on QueryBuilder<JobChat, JobChat, QWhereClause> {
  QueryBuilder<JobChat, JobChat, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> idBetween(
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

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> jobUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'jobUuid',
        value: [null],
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> jobUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'jobUuid',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> jobUuidEqualTo(
      String? jobUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'jobUuid',
        value: [jobUuid],
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterWhereClause> jobUuidNotEqualTo(
      String? jobUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobUuid',
              lower: [],
              upper: [jobUuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobUuid',
              lower: [jobUuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobUuid',
              lower: [jobUuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobUuid',
              lower: [],
              upper: [jobUuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension JobChatQueryFilter
    on QueryBuilder<JobChat, JobChat, QFilterCondition> {
  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> idBetween(
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

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobUuid',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobUuid',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobUuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobUuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobUuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> jobUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobUuid',
        value: '',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sender',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sender',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: '',
      ));
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterFilterCondition> senderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sender',
        value: '',
      ));
    });
  }
}

extension JobChatQueryObject
    on QueryBuilder<JobChat, JobChat, QFilterCondition> {}

extension JobChatQueryLinks
    on QueryBuilder<JobChat, JobChat, QFilterCondition> {}

extension JobChatQuerySortBy on QueryBuilder<JobChat, JobChat, QSortBy> {
  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortByJobUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobUuid', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortByJobUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobUuid', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortBySender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> sortBySenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.desc);
    });
  }
}

extension JobChatQuerySortThenBy
    on QueryBuilder<JobChat, JobChat, QSortThenBy> {
  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByJobUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobUuid', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByJobUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobUuid', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenBySender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.asc);
    });
  }

  QueryBuilder<JobChat, JobChat, QAfterSortBy> thenBySenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.desc);
    });
  }
}

extension JobChatQueryWhereDistinct
    on QueryBuilder<JobChat, JobChat, QDistinct> {
  QueryBuilder<JobChat, JobChat, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<JobChat, JobChat, QDistinct> distinctByJobUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobUuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JobChat, JobChat, QDistinct> distinctByMessage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<JobChat, JobChat, QDistinct> distinctBySender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sender', caseSensitive: caseSensitive);
    });
  }
}

extension JobChatQueryProperty
    on QueryBuilder<JobChat, JobChat, QQueryProperty> {
  QueryBuilder<JobChat, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<JobChat, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<JobChat, String?, QQueryOperations> jobUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobUuid');
    });
  }

  QueryBuilder<JobChat, String?, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<JobChat, String?, QQueryOperations> senderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sender');
    });
  }
}
