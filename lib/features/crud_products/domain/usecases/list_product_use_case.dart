import 'package:distribution/features/crud_products/domain/entities/isar_products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';

class ListProductUseCase {
  final LocalProductRepository _productRepository;
  ListProductUseCase(this._productRepository);
  Future<List<LocalProduct>> getProducts() async {
    final p = await _productRepository.getProducts();
    return p;
  }
}
