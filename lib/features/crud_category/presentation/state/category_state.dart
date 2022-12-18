import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/local_category_repository.dart';
import '../controller/category_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

final listCategories = FutureProvider<List<Category>>(
  (ref) async {
    final list = await sl.get<LocalCategoryRepository>().getCategories();
    return list;
  },
);

final listCategoryController =
    StateNotifierProvider<CategoryController, AsyncValue<List<Category>>>(
        (ref) {
  return CategoryController();
});

final isVisibleFABCategory = StateProvider<bool>(
  (ref) => true,
);
