import 'package:distribution/features/crud_category/domain/repositories/local_category_repository.dart';
import 'package:distribution/features/crud_category/domain/usecases/sync_use_case.dart';
import 'package:distribution/features/crud_category/presentation/state/category_state.dart';
import 'package:distribution/features/crud_employeed/presentation/state/riverpood.dart';
import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';
import 'package:distribution/features/crud_products/domain/usecases/add_product_use_case.dart';
import 'package:distribution/features/crud_products/domain/usecases/delete_product_use_cse.dart';
import 'package:distribution/features/crud_products/domain/usecases/list_product_use_case.dart';
import 'package:distribution/features/crud_products/domain/usecases/sync_product_use_case.dart';
import 'package:distribution/features/crud_products/domain/usecases/update_produc_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/isar_products_entity.dart';
import '../state/riverpood_product.dart';

GetIt sl = GetIt.instance;

class ProductController extends StateNotifier<AsyncValue<List<LocalProduct>>> {
  ProductController(this._ref) : super(const AsyncValue.loading()) {
    getProducts();
  }
  final Ref _ref;

  Future<void> getProducts() async {
    try {
      final employees = await sl.get<ListProductUseCase>().getProducts();

      if (mounted) {
        state = AsyncValue.data(employees);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> syncProducts() async {
    try {
      _ref.read(listCategoryController.notifier).state =
          const AsyncValue.loading();
      _ref.read(listEmployedController.notifier).state =
          const AsyncValue.loading();
      state = const AsyncValue.loading();
      await _ref.read(listCategoryController.notifier).syncCategory();
      final employees = await sl.get<SyncProductUseCase>().syncProducts();
      employees.removeWhere((element) => element.category.value!.id == -1);
      state.whenData((value) {
        if (mounted) {
          state = AsyncValue.data([...value, ...employees]);
        }
      });
      _ref.invalidate(listProductController);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addProduct(Product product) async {
    final id = await sl.get<AddProductUseCase>().addProduct(product);
    final cate = await sl
        .get<LocalCategoryRepository>()
        .getCategoryById(id: product.idCat);
    state.whenData((value) {
      state = AsyncValue.data(
        [
          ...value,
          LocalProduct()
            ..category.value = cate
            ..id = id
            ..isDeleted = product.isDeleted
            ..name = product.name
            ..price = product.price
            ..version = product.version
        ],
      );
    });
  }

  Future<void> deleteProduct(int id) async {
    await sl.get<DeleteProductUseCase>().deleteProduct(id);
    state.whenData((products) {
      products.removeWhere((element) => element.id == id);
      state = AsyncValue.data(products);
    });
  }

  Future<void> updateProduct(Product product) async {
    final p = Product(
      id: product.id,
      price: product.price,
      name: product.name,
      idCat: product.idCat,
      isDeleted: product.isDeleted,
      version: product.version + 1,
    );
    await sl.get<UpdateProductUseCase>().updateProduct(
          p,
        );
    final cate = await sl
        .get<LocalCategoryRepository>()
        .getCategoryById(id: product.idCat);
    state.whenData((products) {
      products[products.indexWhere((element) => element.id == product.id)] =
          LocalProduct()
            ..category.value = cate
            ..id = product.id!
            ..isDeleted = product.isDeleted
            ..name = product.name
            ..price = product.price
            ..version = product.version + 1;

      state = AsyncValue.data(products);
    });
  }
}
