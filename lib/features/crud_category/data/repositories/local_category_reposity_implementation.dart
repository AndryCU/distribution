import '../../domain/entities/category_entity.dart';
import '../../domain/entities/isar_category_entity.dart';
import '../../domain/repositories/local_category_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

final getIt = GetIt.instance;
final isar = getIt.get<Isar>();

class LocalCategoryRepositoryImplementation implements LocalCategoryRepository {
  @override
  Future<void> createCategory(
      {required Category category, required int id}) async {
    final categories = isar.categoryLocals;
    final categoryLocal = CategoryLocal()
      ..id = id
      ..name_cat = category.name_cat
      ..version = category.version
      ..isDeleted = category.isDeleted;
    await isar.writeTxn(
      () async {
        await categories.put(categoryLocal);
      },
    );
  }

  @override
  Future<List<Category>> getCategories() async {
    final categories =
        await isar.categoryLocals.filter().isDeletedEqualTo(false).findAll();
    List<Category> list = [];
    for (var element in categories) {
      list.add(Category(
        id: element.id,
        name_cat: element.name_cat,
        isDeleted: element.isDeleted,
        version: element.version,
      ));
    }
    return list;
  }

  @override
  Future<void> deleteCategory({required int id}) async {
    final categories = isar.categoryLocals;
    final category = await categories.get(id);
    category!.isDeleted = true;
    await isar.writeTxn(() async {
      await categories.put(category);
    });
  }

  @override
  Future<void> updateCategory({required Category category}) async {
    final employees = isar.categoryLocals;
    await isar.writeTxn(() async {
      await employees.put(localCategoryFromRemote(category));
    });
  }

  @override
  Future<void> createMultipleCategories({required List<Category> list}) async {
    final categories = isar.categoryLocals;
    List<CategoryLocal> local = [];
    for (var element in list) {
      local.add(localCategoryFromRemote(element));
    }
    await isar.writeTxn(() async => await categories.putAll(local));
  }

  @override
  Future<int> getMaxId() async {
    final categories = await isar.categoryLocals.where().findAll();
    return categories.isEmpty ? 0 : categories.last.id;
  }

  CategoryLocal localCategoryFromRemote(Category category) {
    return CategoryLocal()
      ..isDeleted = category.isDeleted
      ..name_cat = category.name_cat
      ..version = category.version
      ..id = category.id!;
  }

  @override
  Future<CategoryLocal> getCategoryById({required int id}) async {
    final cat = await isar.categoryLocals.where().idEqualTo(id).findFirst();
    return cat!;
  }
}
