import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';

abstract class RemoteProductRepository {
  Future<List<Product>> getProducts();
  Future<int> createProduct({required Product product});
  Future<void> deleteProduct({required int id});
  Future<void> updateProduct({required Product product});
}
