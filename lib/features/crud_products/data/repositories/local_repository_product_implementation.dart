import 'package:distribution/features/crud_products/domain/entities/isar_products_entity.dart';
import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/local_product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

final getIt = GetIt.instance;
final isar = getIt.get<Isar>();

class LocalProductRepositoryImplementation implements LocalProductRepository {
  @override
  Future<void> createProduct(
      {required Product product, required int id}) async {
    final products = isar.localProducts;
    final newProduct = LocalProduct()
      ..id = id
      ..isDeleted = product.isDeleted
      ..name = product.name
      ..price = product.price
      ..version = product.version;
    await isar.writeTxn(() async => await products.put(newProduct));
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    final products = isar.localProducts;
    final product = await products.get(id);
    product!.isDeleted = true;
    await isar.writeTxn(() async => await products.put(product));
  }

  @override
  Future<int> getMaxId() {
    // TODO: implement getMaxId
    throw UnimplementedError();
  }

  @override
  Future<List<LocalProduct>> getProducts() async {
    List<Product> list = [];
    final products =
        await isar.localProducts.filter().isDeletedEqualTo(false).findAll();
    for (var element in products) {
      list.add(
        Product(
          price: element.price,
          name: element.name,
          idCat: element.id,
          isDeleted: element.isDeleted,
          version: element.version,
        ),
      );
    }
    return products;
  }

  @override
  Future<void> updateProduct({required Product product}) async {
    final products = isar.localProducts;
    await isar.writeTxn(() async {
      final localProduct = LocalProduct()
        ..id = product.id!
        ..isDeleted = product.isDeleted
        ..name = product.name
        ..price = product.price
        ..version = product.version;
      await products.put(localProduct);
    });
  }

  @override
  Future<void> createMultipleProducts(
      {required List<LocalProduct> products}) async {
    final isarProducts = isar.localProducts;
    await isar.writeTxn(() async {
      for (var p in products) {
        await isarProducts.put(p);
        await p.category.save();
      }
    });
  }
}
