import 'dart:ffi';

import 'package:distribution/features/crud_category/domain/entities/isar_category_entity.dart';

import '../entities/category_entity.dart';

abstract class LocalCategoryRepository {
  Future<List<Category>> getCategories();
  Future<void> createCategory({required Category category, required int id});
  Future<void> deleteCategory({required int id});
  Future<void> updateCategory({required Category category});
  Future<int> getMaxId();
  Future<void> createMultipleCategories({required List<Category> list});
  Future<CategoryLocal> getCategoryName({required int id});
}
