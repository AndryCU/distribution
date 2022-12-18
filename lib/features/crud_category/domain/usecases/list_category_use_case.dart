import '../entities/category_entity.dart';
import '../repositories/local_category_repository.dart';

class ListCategoryUseCase {
  final LocalCategoryRepository _localCategoryRepository;

  ListCategoryUseCase(this._localCategoryRepository);
  Future<List<Category>> getCategories() async {
    return _localCategoryRepository.getCategories();
  }
}
