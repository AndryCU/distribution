import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';

class DeleteProductUseCase {
  final RemoteProductRepository _remoteProductRepository;
  final LocalProductRepository _localProductRepository;

  DeleteProductUseCase(
      this._remoteProductRepository, this._localProductRepository);

  Future<void> deleteProduct(int id) async {
    await _remoteProductRepository.deleteProduct(id: id);
    await _localProductRepository.deleteProduct(id: id);
  }
}
