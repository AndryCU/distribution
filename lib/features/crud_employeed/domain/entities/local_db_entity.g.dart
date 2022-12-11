// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetEmployedLocalCollection on Isar {
  IsarCollection<EmployedLocal> get employedLocals => this.collection();
}

const EmployedLocalSchema = CollectionSchema(
  name: r'employed',
  id: 6173663142976160466,
  properties: {
    r'catEmp': PropertySchema(
      id: 0,
      name: r'catEmp',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 1,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 2,
      name: r'gender',
      type: IsarType.string,
    ),
    r'isDeleted': PropertySchema(
      id: 3,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'numberChildren': PropertySchema(
      id: 4,
      name: r'numberChildren',
      type: IsarType.long,
    ),
    r'residence': PropertySchema(
      id: 5,
      name: r'residence',
      type: IsarType.string,
    ),
    r'version': PropertySchema(
      id: 6,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _employedLocalEstimateSize,
  serialize: _employedLocalSerialize,
  deserialize: _employedLocalDeserialize,
  deserializeProp: _employedLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _employedLocalGetId,
  getLinks: _employedLocalGetLinks,
  attach: _employedLocalAttach,
  version: '3.0.2',
);

int _employedLocalEstimateSize(
  EmployedLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.catEmp.length * 3;
  bytesCount += 3 + object.fullName.length * 3;
  bytesCount += 3 + object.gender.length * 3;
  bytesCount += 3 + object.residence.length * 3;
  return bytesCount;
}

void _employedLocalSerialize(
  EmployedLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.catEmp);
  writer.writeString(offsets[1], object.fullName);
  writer.writeString(offsets[2], object.gender);
  writer.writeBool(offsets[3], object.isDeleted);
  writer.writeLong(offsets[4], object.numberChildren);
  writer.writeString(offsets[5], object.residence);
  writer.writeLong(offsets[6], object.version);
}

EmployedLocal _employedLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmployedLocal();
  object.catEmp = reader.readString(offsets[0]);
  object.fullName = reader.readString(offsets[1]);
  object.gender = reader.readString(offsets[2]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[3]);
  object.numberChildren = reader.readLong(offsets[4]);
  object.residence = reader.readString(offsets[5]);
  object.version = reader.readLong(offsets[6]);
  return object;
}

P _employedLocalDeserializeProp<P>(
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
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _employedLocalGetId(EmployedLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _employedLocalGetLinks(EmployedLocal object) {
  return [];
}

void _employedLocalAttach(
    IsarCollection<dynamic> col, Id id, EmployedLocal object) {
  object.id = id;
}

extension EmployedLocalQueryWhereSort
    on QueryBuilder<EmployedLocal, EmployedLocal, QWhere> {
  QueryBuilder<EmployedLocal, EmployedLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EmployedLocalQueryWhere
    on QueryBuilder<EmployedLocal, EmployedLocal, QWhereClause> {
  QueryBuilder<EmployedLocal, EmployedLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterWhereClause> idBetween(
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

extension EmployedLocalQueryFilter
    on QueryBuilder<EmployedLocal, EmployedLocal, QFilterCondition> {
  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catEmp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'catEmp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'catEmp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'catEmp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'catEmp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'catEmp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'catEmp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'catEmp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'catEmp',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      catEmpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'catEmp',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameEqualTo(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameLessThan(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameBetween(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameEndsWith(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      numberChildrenEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberChildren',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      numberChildrenGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberChildren',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      numberChildrenLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberChildren',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      numberChildrenBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberChildren',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'residence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'residence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'residence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'residence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'residence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'residence',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'residence',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'residence',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      residenceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'residence',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      versionGreaterThan(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      versionLessThan(
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

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterFilterCondition>
      versionBetween(
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

extension EmployedLocalQueryObject
    on QueryBuilder<EmployedLocal, EmployedLocal, QFilterCondition> {}

extension EmployedLocalQueryLinks
    on QueryBuilder<EmployedLocal, EmployedLocal, QFilterCondition> {}

extension EmployedLocalQuerySortBy
    on QueryBuilder<EmployedLocal, EmployedLocal, QSortBy> {
  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByCatEmp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catEmp', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByCatEmpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catEmp', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      sortByNumberChildren() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberChildren', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      sortByNumberChildrenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberChildren', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByResidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residence', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      sortByResidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residence', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension EmployedLocalQuerySortThenBy
    on QueryBuilder<EmployedLocal, EmployedLocal, QSortThenBy> {
  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByCatEmp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catEmp', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByCatEmpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catEmp', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      thenByNumberChildren() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberChildren', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      thenByNumberChildrenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberChildren', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByResidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residence', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy>
      thenByResidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'residence', Sort.desc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension EmployedLocalQueryWhereDistinct
    on QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> {
  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> distinctByCatEmp(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'catEmp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct>
      distinctByNumberChildren() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberChildren');
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> distinctByResidence(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'residence', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployedLocal, EmployedLocal, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension EmployedLocalQueryProperty
    on QueryBuilder<EmployedLocal, EmployedLocal, QQueryProperty> {
  QueryBuilder<EmployedLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EmployedLocal, String, QQueryOperations> catEmpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catEmp');
    });
  }

  QueryBuilder<EmployedLocal, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<EmployedLocal, String, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<EmployedLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<EmployedLocal, int, QQueryOperations> numberChildrenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberChildren');
    });
  }

  QueryBuilder<EmployedLocal, String, QQueryOperations> residenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'residence');
    });
  }

  QueryBuilder<EmployedLocal, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
