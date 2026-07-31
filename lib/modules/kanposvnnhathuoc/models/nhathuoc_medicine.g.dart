// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhathuoc_medicine.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNhathuocMedicineCollection on Isar {
  IsarCollection<NhathuocMedicine> get nhathuocMedicines => this.collection();
}

const NhathuocMedicineSchema = CollectionSchema(
  name: r'NhathuocMedicine',
  id: -6110792809255044192,
  properties: {
    r'activeIngredient': PropertySchema(
      id: 0,
      name: r'activeIngredient',
      type: IsarType.string,
    ),
    r'barcode': PropertySchema(
      id: 1,
      name: r'barcode',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.byte,
      enumMap: _NhathuocMedicinecategoryEnumValueMap,
    ),
    r'currentStock': PropertySchema(
      id: 3,
      name: r'currentStock',
      type: IsarType.double,
    ),
    r'dosageForm': PropertySchema(
      id: 4,
      name: r'dosageForm',
      type: IsarType.string,
    ),
    r'expiryDate': PropertySchema(
      id: 5,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'isPrescriptionRequired': PropertySchema(
      id: 6,
      name: r'isPrescriptionRequired',
      type: IsarType.bool,
    ),
    r'medicineId': PropertySchema(
      id: 7,
      name: r'medicineId',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'purchasePrice': PropertySchema(
      id: 9,
      name: r'purchasePrice',
      type: IsarType.double,
    ),
    r'retailPrice': PropertySchema(
      id: 10,
      name: r'retailPrice',
      type: IsarType.double,
    ),
    r'unit': PropertySchema(
      id: 11,
      name: r'unit',
      type: IsarType.string,
    )
  },
  estimateSize: _nhathuocMedicineEstimateSize,
  serialize: _nhathuocMedicineSerialize,
  deserialize: _nhathuocMedicineDeserialize,
  deserializeProp: _nhathuocMedicineDeserializeProp,
  idName: r'id',
  indexes: {
    r'medicineId': IndexSchema(
      id: 6094895651756910893,
      name: r'medicineId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'medicineId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _nhathuocMedicineGetId,
  getLinks: _nhathuocMedicineGetLinks,
  attach: _nhathuocMedicineAttach,
  version: '3.1.0+1',
);

int _nhathuocMedicineEstimateSize(
  NhathuocMedicine object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeIngredient.length * 3;
  bytesCount += 3 + object.barcode.length * 3;
  bytesCount += 3 + object.dosageForm.length * 3;
  bytesCount += 3 + object.medicineId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.unit.length * 3;
  return bytesCount;
}

void _nhathuocMedicineSerialize(
  NhathuocMedicine object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activeIngredient);
  writer.writeString(offsets[1], object.barcode);
  writer.writeByte(offsets[2], object.category.index);
  writer.writeDouble(offsets[3], object.currentStock);
  writer.writeString(offsets[4], object.dosageForm);
  writer.writeDateTime(offsets[5], object.expiryDate);
  writer.writeBool(offsets[6], object.isPrescriptionRequired);
  writer.writeString(offsets[7], object.medicineId);
  writer.writeString(offsets[8], object.name);
  writer.writeDouble(offsets[9], object.purchasePrice);
  writer.writeDouble(offsets[10], object.retailPrice);
  writer.writeString(offsets[11], object.unit);
}

NhathuocMedicine _nhathuocMedicineDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NhathuocMedicine();
  object.activeIngredient = reader.readString(offsets[0]);
  object.barcode = reader.readString(offsets[1]);
  object.category = _NhathuocMedicinecategoryValueEnumMap[
          reader.readByteOrNull(offsets[2])] ??
      MedicineCategory.ANTIBIOTIC;
  object.currentStock = reader.readDouble(offsets[3]);
  object.dosageForm = reader.readString(offsets[4]);
  object.expiryDate = reader.readDateTimeOrNull(offsets[5]);
  object.id = id;
  object.isPrescriptionRequired = reader.readBool(offsets[6]);
  object.medicineId = reader.readString(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.purchasePrice = reader.readDouble(offsets[9]);
  object.retailPrice = reader.readDouble(offsets[10]);
  object.unit = reader.readString(offsets[11]);
  return object;
}

P _nhathuocMedicineDeserializeProp<P>(
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
      return (_NhathuocMedicinecategoryValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MedicineCategory.ANTIBIOTIC) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NhathuocMedicinecategoryEnumValueMap = {
  'ANTIBIOTIC': 0,
  'PAINKILLER': 1,
  'DIGESTIVE': 2,
  'VITAMIN': 3,
  'CARDIOVASCULAR': 4,
  'OTHER': 5,
};
const _NhathuocMedicinecategoryValueEnumMap = {
  0: MedicineCategory.ANTIBIOTIC,
  1: MedicineCategory.PAINKILLER,
  2: MedicineCategory.DIGESTIVE,
  3: MedicineCategory.VITAMIN,
  4: MedicineCategory.CARDIOVASCULAR,
  5: MedicineCategory.OTHER,
};

Id _nhathuocMedicineGetId(NhathuocMedicine object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nhathuocMedicineGetLinks(NhathuocMedicine object) {
  return [];
}

void _nhathuocMedicineAttach(
    IsarCollection<dynamic> col, Id id, NhathuocMedicine object) {
  object.id = id;
}

extension NhathuocMedicineByIndex on IsarCollection<NhathuocMedicine> {
  Future<NhathuocMedicine?> getByMedicineId(String medicineId) {
    return getByIndex(r'medicineId', [medicineId]);
  }

  NhathuocMedicine? getByMedicineIdSync(String medicineId) {
    return getByIndexSync(r'medicineId', [medicineId]);
  }

  Future<bool> deleteByMedicineId(String medicineId) {
    return deleteByIndex(r'medicineId', [medicineId]);
  }

  bool deleteByMedicineIdSync(String medicineId) {
    return deleteByIndexSync(r'medicineId', [medicineId]);
  }

  Future<List<NhathuocMedicine?>> getAllByMedicineId(
      List<String> medicineIdValues) {
    final values = medicineIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'medicineId', values);
  }

  List<NhathuocMedicine?> getAllByMedicineIdSync(
      List<String> medicineIdValues) {
    final values = medicineIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'medicineId', values);
  }

  Future<int> deleteAllByMedicineId(List<String> medicineIdValues) {
    final values = medicineIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'medicineId', values);
  }

  int deleteAllByMedicineIdSync(List<String> medicineIdValues) {
    final values = medicineIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'medicineId', values);
  }

  Future<Id> putByMedicineId(NhathuocMedicine object) {
    return putByIndex(r'medicineId', object);
  }

  Id putByMedicineIdSync(NhathuocMedicine object, {bool saveLinks = true}) {
    return putByIndexSync(r'medicineId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMedicineId(List<NhathuocMedicine> objects) {
    return putAllByIndex(r'medicineId', objects);
  }

  List<Id> putAllByMedicineIdSync(List<NhathuocMedicine> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'medicineId', objects, saveLinks: saveLinks);
  }
}

extension NhathuocMedicineQueryWhereSort
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QWhere> {
  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NhathuocMedicineQueryWhere
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QWhereClause> {
  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause> idBetween(
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause>
      medicineIdEqualTo(String medicineId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'medicineId',
        value: [medicineId],
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterWhereClause>
      medicineIdNotEqualTo(String medicineId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineId',
              lower: [],
              upper: [medicineId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineId',
              lower: [medicineId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineId',
              lower: [medicineId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'medicineId',
              lower: [],
              upper: [medicineId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NhathuocMedicineQueryFilter
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QFilterCondition> {
  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'activeIngredient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'activeIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'activeIngredient',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activeIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      activeIngredientIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'activeIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      barcodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcode',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      categoryEqualTo(MedicineCategory value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      categoryGreaterThan(
    MedicineCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      categoryLessThan(
    MedicineCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      categoryBetween(
    MedicineCategory lower,
    MedicineCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      currentStockEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      currentStockGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      currentStockLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentStock',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      currentStockBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentStock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageForm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosageForm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosageForm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosageForm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosageForm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosageForm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosageForm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosageForm',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosageForm',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      dosageFormIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosageForm',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      expiryDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      expiryDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expiryDate',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      expiryDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      expiryDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      expiryDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      expiryDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      isPrescriptionRequiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPrescriptionRequired',
        value: value,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicineId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'medicineId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'medicineId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'medicineId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'medicineId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'medicineId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'medicineId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'medicineId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'medicineId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      medicineIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'medicineId',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
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

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      purchasePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      purchasePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      purchasePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      purchasePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchasePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      retailPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retailPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      retailPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retailPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      retailPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retailPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      retailPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retailPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension NhathuocMedicineQueryObject
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QFilterCondition> {}

extension NhathuocMedicineQueryLinks
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QFilterCondition> {}

extension NhathuocMedicineQuerySortBy
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QSortBy> {
  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByActiveIngredient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByActiveIngredientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByCurrentStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByDosageForm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageForm', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByDosageFormDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageForm', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByIsPrescriptionRequired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrescriptionRequired', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByIsPrescriptionRequiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrescriptionRequired', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByMedicineId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByMedicineIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByPurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByRetailPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retailPrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByRetailPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retailPrice', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension NhathuocMedicineQuerySortThenBy
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QSortThenBy> {
  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByActiveIngredient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByActiveIngredientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeIngredient', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByBarcode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByBarcodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcode', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByCurrentStockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentStock', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByDosageForm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageForm', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByDosageFormDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosageForm', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByIsPrescriptionRequired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrescriptionRequired', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByIsPrescriptionRequiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrescriptionRequired', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByMedicineId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineId', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByMedicineIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'medicineId', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByPurchasePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePrice', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByRetailPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retailPrice', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByRetailPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retailPrice', Sort.desc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension NhathuocMedicineQueryWhereDistinct
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct> {
  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByActiveIngredient({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeIngredient',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct> distinctByBarcode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByCurrentStock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentStock');
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByDosageForm({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosageForm', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByIsPrescriptionRequired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPrescriptionRequired');
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByMedicineId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'medicineId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByPurchasePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchasePrice');
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct>
      distinctByRetailPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retailPrice');
    });
  }

  QueryBuilder<NhathuocMedicine, NhathuocMedicine, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension NhathuocMedicineQueryProperty
    on QueryBuilder<NhathuocMedicine, NhathuocMedicine, QQueryProperty> {
  QueryBuilder<NhathuocMedicine, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NhathuocMedicine, String, QQueryOperations>
      activeIngredientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeIngredient');
    });
  }

  QueryBuilder<NhathuocMedicine, String, QQueryOperations> barcodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcode');
    });
  }

  QueryBuilder<NhathuocMedicine, MedicineCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<NhathuocMedicine, double, QQueryOperations>
      currentStockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentStock');
    });
  }

  QueryBuilder<NhathuocMedicine, String, QQueryOperations>
      dosageFormProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosageForm');
    });
  }

  QueryBuilder<NhathuocMedicine, DateTime?, QQueryOperations>
      expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<NhathuocMedicine, bool, QQueryOperations>
      isPrescriptionRequiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPrescriptionRequired');
    });
  }

  QueryBuilder<NhathuocMedicine, String, QQueryOperations>
      medicineIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'medicineId');
    });
  }

  QueryBuilder<NhathuocMedicine, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<NhathuocMedicine, double, QQueryOperations>
      purchasePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchasePrice');
    });
  }

  QueryBuilder<NhathuocMedicine, double, QQueryOperations>
      retailPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retailPrice');
    });
  }

  QueryBuilder<NhathuocMedicine, String, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
