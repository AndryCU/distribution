import '../../domain/entities/category_entity.dart';
import '../controller/category_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

final listCategoryController =
    StateNotifierProvider<CategoryController, AsyncValue<List<Category>>>(
        (ref) {
  return CategoryController(ref);
});

final isVisibleFABCategory = StateProvider<bool>(
  (ref) => true,
);
