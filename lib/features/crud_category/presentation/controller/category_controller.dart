import 'package:distribution/features/crud_category/domain/usecases/delete_category_use_case.dart';
import 'package:distribution/features/crud_category/domain/usecases/update_category_use_case.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/local_category_repository.dart';
import '../../domain/usecases/add_category_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class CategoryController extends StateNotifier<AsyncValue<List<Category>>> {
  CategoryController() : super(const AsyncValue.loading()) {
    getCategories();
  }
  Future<void> getCategories() async {
    try {
      state = const AsyncValue.loading();
      final categories =
          await sl.get<LocalCategoryRepository>().getCategories();
      if (mounted) {
        state = AsyncValue.data(categories);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> addCategory(Category category) async {
    final id = await sl.get<AddCategoryUseCase>().addCategory(category);
    final newCat = category.copyWith(id: id);
    state.whenData(
      (categories) {
        state = AsyncValue.data([...categories, newCat]);
      },
    );
  }

  Future<void> updateCategory(Category category) async {
    await sl.get<UpdateCategoryUseCase>().updateCategory(category);
    state.whenData((categories) {
      categories[categories
          .indexWhere((element) => element.id == category.id)] = category;
      state = AsyncValue.data(categories);
    });
  }

  Future<void> deleteCategory(int id) async {
    await sl.get<DeleteCategoryUseCase>().deleteCategory(id);
    state.whenData((categories) {
      categories.removeWhere((element) => element.id == id);
      state = AsyncValue.data(categories);
    });
  }
}
