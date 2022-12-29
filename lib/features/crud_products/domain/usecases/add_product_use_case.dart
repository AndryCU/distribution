import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';

class AddProductUseCase {
  AddProductUseCase(
      this._remoteProductRepository, this._localProductRepository);

  final RemoteProductRepository _remoteProductRepository;
  final LocalProductRepository _localProductRepository;
  Future<int> addProduct(Product product) async {
    final idForIsar =
        await _remoteProductRepository.createProduct(product: product);
    await _localProductRepository.createProduct(
        product: product, id: idForIsar);
    return idForIsar;
  }
}
