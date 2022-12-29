import 'package:distribution/features/crud_category/domain/usecases/sync_use_case.dart';
import 'package:distribution/features/crud_products/data/repositories/remote_repository_product_implementation.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';
import 'package:distribution/features/crud_products/domain/usecases/add_product_use_case.dart';
import 'package:distribution/features/crud_products/domain/usecases/delete_product_use_cse.dart';
import 'package:distribution/features/crud_products/domain/usecases/sync_product_use_case.dart';

import '../features/crud_category/data/repositories/remote_category_repository_implementation.dart';
import '../features/crud_category/domain/entities/isar_category_entity.dart';
import '../features/crud_category/domain/repositories/remote_category_repository.dart';
import '../features/crud_category/domain/usecases/add_category_use_case.dart';
import '../features/crud_category/domain/usecases/delete_category_use_case.dart';
import '../features/crud_category/domain/usecases/update_category_use_case.dart';
import '../features/crud_employeed/data/repositories/remote_employed_repository_implementation.dart';
import '../features/crud_employeed/domain/usecases/add_employe_use_case.dart';
import '../features/crud_employeed/presentation/pages/crud_employed.dart';
import '../features/crud_products/data/repositories/local_repository_product_implementation.dart';
import '../features/crud_products/domain/entities/isar_products_entity.dart';
import '../features/crud_products/domain/usecases/list_product_use_case.dart';
import '../features/crud_products/domain/usecases/update_produc_use_case.dart';
import '../utils/data_base_strings.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../features/crud_category/data/repositories/local_category_reposity_implementation.dart';
import '../features/crud_category/domain/repositories/local_category_repository.dart';
import '../features/crud_category/domain/usecases/list_category_use_case.dart';
import '../features/crud_employeed/data/repositories/local_employed_repository_implementation.dart';
import '../features/crud_employeed/domain/entities/local_db_entity.dart';
import '../features/crud_employeed/domain/repositories/employed_repository.dart';
import '../features/crud_employeed/domain/repositories/local_employed_repository.dart';
import '../features/crud_employeed/domain/usecases/delete_employed.dart';
import '../features/crud_employeed/domain/usecases/list_remote_use_case.dart';
import '../features/crud_employeed/domain/usecases/sync_use_case.dart';
import '../features/crud_employeed/domain/usecases/update_employed_use_case.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  //////////////////GENERAL//////////
  locator.registerSingleton<SupabaseClient>(
      SupabaseClient(DataBaseStrings.supabaseUrl, DataBaseStrings.supabaseKey));
  final dir = await getApplicationSupportDirectory();
  final isarDb = await Isar.open([
    EmployedLocalSchema,
    CategoryLocalSchema,
    LocalProductSchema,
  ], inspector: true, directory: dir.path);
  locator.registerSingleton<Isar>(isarDb);
  //////////////////GENERAL END//////////

  //////////////////EMPLOYED REPOS//////////
  locator.registerSingleton<RemoteEmployedRepository>(
      RemoteEmployedRepositoryImplementation());
  locator.registerSingleton<LocalEmployedRepository>(
      LocalEmployedRepositoryImplementation());
  //////////////////END EMPLOYED REPOS//////////

  //////////////EMPLOYED USECASES//////////////
  locator.registerSingleton<AddEmployedUseCase>(AddEmployedUseCase(sl(), sl()));
  locator.registerSingleton<UpdateEmployedUseCase>(
      UpdateEmployedUseCase(sl(), sl()));
  locator.registerSingleton<DeleteEmployedUseCase>(
      DeleteEmployedUseCase(sl(), sl()));
  locator.registerSingleton<RemoteListEmployedUseCase>(
      RemoteListEmployedUseCase(sl()));
  locator
      .registerSingleton<SyncEmployedUseCase>(SyncEmployedUseCase(sl(), sl()));
  //////////////END EMPLOYED USECASES//////////////

  //////////////////CATEGORY REPOS//////////
  locator.registerSingleton<RemoteCategoryRepository>(
      RemoteCategoryRepositoryImplementation());
  locator.registerSingleton<LocalCategoryRepository>(
      LocalCategoryRepositoryImplementation());
  //////////////////END CATEGORY REPOS//////

  //////////////////CATEGORY REPOS//////
  locator.registerSingleton<AddCategoryUseCase>(AddCategoryUseCase(sl(), sl()));
  locator.registerSingleton<ListCategoryUseCase>(ListCategoryUseCase(sl()));
  locator.registerSingleton<DeleteCategoryUseCase>(
      DeleteCategoryUseCase(sl(), sl()));
  locator.registerSingleton<UpdateCategoryUseCase>(
      UpdateCategoryUseCase(sl(), sl()));
  locator
      .registerSingleton<SyncCategoryUseCase>(SyncCategoryUseCase(sl(), sl()));
  //////////////////END CATEGORY REPOS//////

  ///PRODUCTS REPOS////////
  locator.registerSingleton<RemoteProductRepository>(
      RemoteProductRepositoryImplementation());
  locator.registerSingleton<LocalProductRepository>(
      LocalProductRepositoryImplementation());

  ///END PRODUCTS REPOS///

  ///PRODUCTS USES CASES///
  locator.registerSingleton<AddProductUseCase>(AddProductUseCase(sl(), sl()));
  locator.registerSingleton<SyncProductUseCase>(
      SyncProductUseCase(sl(), sl(), sl()));
  locator.registerSingleton<ListProductUseCase>(ListProductUseCase(sl()));
  locator.registerSingleton<DeleteProductUseCase>(
      DeleteProductUseCase(sl(), sl()));
  locator.registerSingleton<UpdateProductUseCase>(
      UpdateProductUseCase(sl(), sl()));

  ///END PRODUCTS USES CASES///
}
