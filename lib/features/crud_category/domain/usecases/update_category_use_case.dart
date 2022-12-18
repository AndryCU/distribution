import 'package:distribution/features/crud_category/domain/entities/category_entity.dart';
import 'package:distribution/features/crud_category/domain/repositories/local_category_repository.dart';
import 'package:distribution/features/crud_category/domain/repositories/remote_category_repository.dart';

class UpdateCategoryUseCase {
  final RemoteCategoryRepository _remoteCategoryRepository;
  final LocalCategoryRepository _localCategoryRepository;

  UpdateCategoryUseCase(
      this._remoteCategoryRepository, this._localCategoryRepository);

  Future<void> updateCategory(Category category) async {
    await _remoteCategoryRepository.updateCategory(model: category);
    await _localCategoryRepository.updateCategory(category: category);
  }
}
