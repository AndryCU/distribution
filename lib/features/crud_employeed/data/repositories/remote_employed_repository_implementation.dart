import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/employed_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

class RemoteEmployedRepositoryImplementation
    implements RemoteEmployedRepository {
  final String tableName = "employed";
  final supabase = getIt.get<SupabaseClient>();

  @override
  Future<int> createEmployed(
      {required RemoteEmployedModel employedModel}) async {
    final response = await supabase
        .from(tableName)
        .insert(employedModel.toJson())
        .select('id');
    return 0;
  }

  @override
  Future<void> deleteEmployed({required int id}) async {
    //FIXME incerto un empleado, genera id=-1 localmente, y online si esta bien, si lo trato de borrar no hace pq no coinciden los id
    // ver si cuando sync las bd se arregla...
    final data = await supabase.from(tableName).delete().match({'id': id});
  }

  @override
  Future<List<RemoteEmployedModel>> getEmployees() async {
    List<RemoteEmployedModel> list = [];
    final a = await supabase.from(tableName).select('*') as List;
    list = a.map((i) => RemoteEmployedModel.fromJson(i)).toList();
    return list;
  }

  @override
  void updateEmployed(
      {required int id, required RemoteEmployedModel model}) async {
    await supabase.from(tableName).update(model.toJson()).match({'id': '$id'});
  }
}
