import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/remote_category_repository.dart';

final getIt = GetIt.instance;

class RemoteCategoryRepositoryImplementation
    implements RemoteCategoryRepository {
  final String tableName = "catproduct";
  final supabase = getIt.get<SupabaseClient>();

  @override
  Future<int> createCategory({required Category category}) async {
    final response =
        await supabase.from(tableName).insert(category.toJson()).select('id');
    return response[0]['id'] as int;
  }

  @override
  Future<void> deleteCategory({required int id}) async {
    await supabase
        .from(tableName)
        .update({'isDeleted': true}).match({'id': '$id'});
  }

  @override
  Future<List<Category>> getCategories() async {
    List<Category> list = [];
    final a = await supabase.from(tableName).select('*').eq('isDeleted', false)
        as List;
    list = a.map((i) => Category.fromJson(i)).toList();
    return list;
  }

  @override
  Future<int> getMaxRemoteId() async {
    final maxId = supabase
        .from(tableName)
        .select('id')
        .order('id', ascending: false)
        .limit(1) as List;
    return maxId[0]['id'] as int;
  }

  @override
  Future<List<Category>> getNewCategory({required int id}) async {
    List<Category> list = [];
    final a = await supabase
        .from(tableName)
        .select('*')
        .eq('isDeleted', false)
        .gt('id', id) as List;
    list = a.map((e) => Category.fromJson(e)).toList();
    return list;
  }

  @override
  Future<void> updateCategory({required Category model}) async {
    await supabase
        .from(tableName)
        .update(model.toJson())
        .match({'id': '${model.id}'});
  }
}
