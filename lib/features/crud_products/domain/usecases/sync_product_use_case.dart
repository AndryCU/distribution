import 'package:distribution/features/crud_category/domain/repositories/local_category_repository.dart';
import 'package:distribution/features/crud_products/domain/entities/isar_products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';

class SyncProductUseCase {
  final LocalProductRepository _localProductRepository;
  final RemoteProductRepository _remoteProductRepository;
  final LocalCategoryRepository _localCategoryRepository;

  SyncProductUseCase(this._localProductRepository,
      this._remoteProductRepository, this._localCategoryRepository);
  Future<List<LocalProduct>> syncProducts() async {
    List<LocalProduct> products = [];
    final p = await _remoteProductRepository.getProducts();
    for (var element in p) {
      final product =
          await _localCategoryRepository.getCategoryById(id: element.idCat);
      products.add(
        LocalProduct()
          ..category.value = product
          ..id = element.id!
          ..isDeleted = element.isDeleted
          ..name = element.name
          ..price = element.price
          ..version = element.version,
      );
    }
    await _localProductRepository.createMultipleProducts(products: products);
    return products;
  }
}
