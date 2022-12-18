import '../entities/category_entity.dart';

abstract class RemoteCategoryRepository {
  Future<List<Category>> getCategories();
  Future<int> createCategory({required Category category});
  Future<void> deleteCategory({required int id});
  Future<void> updateCategory({required Category model});
  Future<int> getMaxRemoteId();
  Future<List<Category>> getNewCategory({required int id});
}
