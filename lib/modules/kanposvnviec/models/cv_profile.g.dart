// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cv_profile.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCvProfileCollection on Isar {
  IsarCollection<CvProfile> get cvProfiles => this.collection();
}

const CvProfileSchema = CollectionSchema(
  name: r'CvProfile',
  id: -4731313465645345952,
  properties: {
    r'desiredPosition': PropertySchema(
      id: 0,
      name: r'desiredPosition',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 1,
      name: r'email',
      type: IsarType.string,
    ),
    r'expectedSalary': PropertySchema(
      id: 2,
      name: r'expectedSalary',
      type: IsarType.double,
    ),
    r'experience': PropertySchema(
      id: 3,
      name: r'experience',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 4,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 5,
      name: r'phone',
      type: IsarType.string,
    ),
    r'skills': PropertySchema(
      id: 6,
      name: r'skills',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _cvProfileEstimateSize,
  serialize: _cvProfileSerialize,
  deserialize: _cvProfileDeserialize,
  deserializeProp: _cvProfileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cvProfileGetId,
  getLinks: _cvProfileGetLinks,
  attach: _cvProfileAttach,
  version: '3.1.0+1',
);

int _cvProfileEstimateSize(
  CvProfile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.desiredPosition;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.experience;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.skills;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _cvProfileSerialize(
  CvProfile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.desiredPosition);
  writer.writeString(offsets[1], object.email);
  writer.writeDouble(offsets[2], object.expectedSalary);
  writer.writeString(offsets[3], object.experience);
  writer.writeString(offsets[4], object.fullName);
  writer.writeString(offsets[5], object.phone);
  writer.writeString(offsets[6], object.skills);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

CvProfile _cvProfileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CvProfile();
  object.desiredPosition = reader.readStringOrNull(offsets[0]);
  object.email = reader.readStringOrNull(offsets[1]);
  object.expectedSalary = reader.readDoubleOrNull(offsets[2]);
  object.experience = reader.readStringOrNull(offsets[3]);
  object.fullName = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.phone = reader.readStringOrNull(offsets[5]);
  object.skills = reader.readStringOrNull(offsets[6]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _cvProfileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cvProfileGetId(CvProfile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cvProfileGetLinks(CvProfile object) {
  return [];
}

void _cvProfileAttach(IsarCollection<dynamic> col, Id id, CvProfile object) {
  object.id = id;
}

extension CvProfileQueryWhereSort
    on QueryBuilder<CvProfile, CvProfile, QWhere> {
  QueryBuilder<CvProfile, CvProfile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CvProfileQueryWhere
    on QueryBuilder<CvProfile, CvProfile, QWhereClause> {
  QueryBuilder<CvProfile, CvProfile, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CvProfile, CvProfile, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterWhereClause> idBetween(
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

extension CvProfileQueryFilter
    on QueryBuilder<CvProfile, CvProfile, QFilterCondition> {
  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'desiredPosition',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'desiredPosition',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desiredPosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'desiredPosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'desiredPosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'desiredPosition',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'desiredPosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'desiredPosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'desiredPosition',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'desiredPosition',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'desiredPosition',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      desiredPositionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'desiredPosition',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      expectedSalaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expectedSalary',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      expectedSalaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expectedSalary',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      expectedSalaryEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expectedSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      expectedSalaryGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expectedSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      expectedSalaryLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expectedSalary',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      expectedSalaryBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expectedSalary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'experience',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      experienceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'experience',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experience',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      experienceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'experience',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'experience',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'experience',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      experienceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'experience',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'experience',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'experience',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> experienceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'experience',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      experienceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experience',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      experienceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'experience',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameEqualTo(
    String? value, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameGreaterThan(
    String? value, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameLessThan(
    String? value, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameStartsWith(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameEndsWith(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameContains(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameMatches(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneEqualTo(
    String? value, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneGreaterThan(
    String? value, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneLessThan(
    String? value, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneStartsWith(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneEndsWith(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneContains(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneMatches(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skills',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skills',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skills',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skills',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skills',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> skillsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skills',
        value: '',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition>
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<CvProfile, CvProfile, QAfterFilterCondition> updatedAtBetween(
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

extension CvProfileQueryObject
    on QueryBuilder<CvProfile, CvProfile, QFilterCondition> {}

extension CvProfileQueryLinks
    on QueryBuilder<CvProfile, CvProfile, QFilterCondition> {}

extension CvProfileQuerySortBy on QueryBuilder<CvProfile, CvProfile, QSortBy> {
  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByDesiredPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredPosition', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByDesiredPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredPosition', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByExpectedSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedSalary', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByExpectedSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedSalary', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experience', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experience', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortBySkills() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skills', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortBySkillsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skills', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CvProfileQuerySortThenBy
    on QueryBuilder<CvProfile, CvProfile, QSortThenBy> {
  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByDesiredPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredPosition', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByDesiredPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'desiredPosition', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByExpectedSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedSalary', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByExpectedSalaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expectedSalary', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experience', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experience', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenBySkills() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skills', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenBySkillsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skills', Sort.desc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension CvProfileQueryWhereDistinct
    on QueryBuilder<CvProfile, CvProfile, QDistinct> {
  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByDesiredPosition(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'desiredPosition',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByExpectedSalary() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expectedSalary');
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByExperience(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'experience', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctBySkills(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skills', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CvProfile, CvProfile, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension CvProfileQueryProperty
    on QueryBuilder<CvProfile, CvProfile, QQueryProperty> {
  QueryBuilder<CvProfile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CvProfile, String?, QQueryOperations> desiredPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'desiredPosition');
    });
  }

  QueryBuilder<CvProfile, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<CvProfile, double?, QQueryOperations> expectedSalaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expectedSalary');
    });
  }

  QueryBuilder<CvProfile, String?, QQueryOperations> experienceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'experience');
    });
  }

  QueryBuilder<CvProfile, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<CvProfile, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<CvProfile, String?, QQueryOperations> skillsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skills');
    });
  }

  QueryBuilder<CvProfile, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
