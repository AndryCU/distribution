import '../entities/category_entity.dart';
import '../repositories/local_category_repository.dart';
import '../repositories/remote_category_repository.dart';

class AddCategoryUseCase {
  final RemoteCategoryRepository _remoteCategoryRepository;
  final LocalCategoryRepository _localCategoryRepository;
  AddCategoryUseCase(
      this._remoteCategoryRepository, this._localCategoryRepository);

  Future<int> addCategory(Category category) async {
    final idIsar =
        await _remoteCategoryRepository.createCategory(category: category);
    await _localCategoryRepository.createCategory(
        category: category, id: idIsar);
    return idIsar;
  }
}
