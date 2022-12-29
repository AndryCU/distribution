import 'package:distribution/features/crud_products/domain/entities/isar_products_entity.dart';
import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';

class UpdateProductUseCase {
  final RemoteProductRepository _remoteProductRepository;
  final LocalProductRepository _localProductRepository;

  UpdateProductUseCase(
      this._remoteProductRepository, this._localProductRepository);

  Future<void> updateProduct(Product localProduct) async {
    await _remoteProductRepository.updateProduct(product: localProduct);
    await _localProductRepository.updateProduct(product: localProduct);
  }
}
