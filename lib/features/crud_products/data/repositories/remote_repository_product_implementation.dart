import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';
import 'package:distribution/features/crud_products/domain/repositories/remote_product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

class RemoteProductRepositoryImplementation implements RemoteProductRepository {
  final String tableName = 'product';
  final supabase = getIt.get<SupabaseClient>();

  @override
  Future<int> createProduct({required Product product}) async {
    final response =
        await supabase.from(tableName).insert(product.toJson()).select('id');
    return response[0]['id'] as int;
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    await supabase
        .from(tableName)
        .update({'isDeleted': true}).match({'id': id});
  }

  @override
  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    final remoteProducts = await supabase
        .from(tableName)
        .select('*')
        .eq('isDeleted', false) as List;
    products = remoteProducts.map((e) => Product.fromJson(e)).toList();
    return products;
  }

  @override
  Future<void> updateProduct({required Product product}) async {
    await supabase
        .from(tableName)
        .update(product.toJson())
        .match({'id': product.id});
  }

  Future<void> deleteAll() async {
    await supabase.from(tableName).delete().not('id', 'eq', 89);
  }
}
