import 'package:distribution/features/crud_category/domain/entities/category_entity.dart';
import 'package:distribution/features/crud_category/domain/repositories/local_category_repository.dart';
import 'package:distribution/features/crud_category/domain/repositories/remote_category_repository.dart';

class SyncCategoryUseCase {
  final RemoteCategoryRepository _remoteCategoryRepository;
  final LocalCategoryRepository _localCategoryRepository;

  SyncCategoryUseCase(
      this._remoteCategoryRepository, this._localCategoryRepository);

  Future<List<Category>> syncCategories() async {
    List<Category> listNewCategories = [];
    listNewCategories = await _remoteCategoryRepository.getNewCategory(id: 0);
    await _localCategoryRepository.createMultipleCategories(
        list: listNewCategories);
    return listNewCategories;
  }
}
