// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_category_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetCategoryLocalCollection on Isar {
  IsarCollection<CategoryLocal> get categoryLocals => this.collection();
}

const CategoryLocalSchema = CollectionSchema(
  name: r'catproduct',
  id: -7112830314436901573,
  properties: {
    r'isDeleted': PropertySchema(
      id: 0,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'name_cat': PropertySchema(
      id: 1,
      name: r'name_cat',
      type: IsarType.string,
    ),
    r'version': PropertySchema(
      id: 2,
      name: r'version',
      type: IsarType.long,
    )
  },
  estimateSize: _categoryLocalEstimateSize,
  serialize: _categoryLocalSerialize,
  deserialize: _categoryLocalDeserialize,
  deserializeProp: _categoryLocalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _categoryLocalGetId,
  getLinks: _categoryLocalGetLinks,
  attach: _categoryLocalAttach,
  version: '3.0.2',
);

int _categoryLocalEstimateSize(
  CategoryLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name_cat.length * 3;
  return bytesCount;
}

void _categoryLocalSerialize(
  CategoryLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isDeleted);
  writer.writeString(offsets[1], object.name_cat);
  writer.writeLong(offsets[2], object.version);
}

CategoryLocal _categoryLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoryLocal();
  object.id = id;
  object.isDeleted = reader.readBool(offsets[0]);
  object.name_cat = reader.readString(offsets[1]);
  object.version = reader.readLong(offsets[2]);
  return object;
}

P _categoryLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoryLocalGetId(CategoryLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoryLocalGetLinks(CategoryLocal object) {
  return [];
}

void _categoryLocalAttach(
    IsarCollection<dynamic> col, Id id, CategoryLocal object) {
  object.id = id;
}

extension CategoryLocalQueryWhereSort
    on QueryBuilder<CategoryLocal, CategoryLocal, QWhere> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoryLocalQueryWhere
    on QueryBuilder<CategoryLocal, CategoryLocal, QWhereClause> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterWhereClause> idBetween(
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

extension CategoryLocalQueryFilter
    on QueryBuilder<CategoryLocal, CategoryLocal, QFilterCondition> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name_cat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name_cat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name_cat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name_cat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name_cat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name_cat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name_cat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name_cat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name_cat',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      name_catIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name_cat',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterFilterCondition>
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

extension CategoryLocalQueryObject
    on QueryBuilder<CategoryLocal, CategoryLocal, QFilterCondition> {}

extension CategoryLocalQueryLinks
    on QueryBuilder<CategoryLocal, CategoryLocal, QFilterCondition> {}

extension CategoryLocalQuerySortBy
    on QueryBuilder<CategoryLocal, CategoryLocal, QSortBy> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> sortByName_cat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name_cat', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      sortByName_catDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name_cat', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CategoryLocalQuerySortThenBy
    on QueryBuilder<CategoryLocal, CategoryLocal, QSortThenBy> {
  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByName_cat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name_cat', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy>
      thenByName_catDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name_cat', Sort.desc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension CategoryLocalQueryWhereDistinct
    on QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> {
  QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> distinctByName_cat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name_cat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategoryLocal, CategoryLocal, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension CategoryLocalQueryProperty
    on QueryBuilder<CategoryLocal, CategoryLocal, QQueryProperty> {
  QueryBuilder<CategoryLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CategoryLocal, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<CategoryLocal, String, QQueryOperations> name_catProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name_cat');
    });
  }

  QueryBuilder<CategoryLocal, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}
