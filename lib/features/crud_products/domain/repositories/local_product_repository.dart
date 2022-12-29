import 'dart:ffi';

import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';

import '../entities/isar_products_entity.dart';

abstract class LocalProductRepository {
  Future<List<LocalProduct>> getProducts();
  Future<void> createProduct({required Product product, required int id});
  Future<void> deleteProduct({required int id});
  Future<void> updateProduct({required Product product});
  Future<int> getMaxId();
  Future<void> createMultipleProducts({required List<LocalProduct> products});
}
