import 'package:distribution/features/crud_category/domain/repositories/local_category_repository.dart';
import 'package:distribution/features/crud_category/domain/repositories/remote_category_repository.dart';

class DeleteCategoryUseCase {
  final RemoteCategoryRepository _remoteCategoryRepository;
  final LocalCategoryRepository _localCategoryRepository;

  DeleteCategoryUseCase(
      this._remoteCategoryRepository, this._localCategoryRepository);

  Future<void> deleteCategory(int id) async {
    await _remoteCategoryRepository.deleteCategory(id: id);
    await _localCategoryRepository.deleteCategory(id: id);
  }
}
