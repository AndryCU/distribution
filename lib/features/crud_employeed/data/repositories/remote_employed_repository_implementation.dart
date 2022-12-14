import 'dart:convert';

import '../model/remote_employe_model.dart';
import '../../domain/repositories/employed_repository.dart';
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
    return response[0]['id'] as int;
  }

  @override
  Future<void> deleteEmployed({required int id}) async {
    await supabase
        .from(tableName)
        .update({'isDeleted': true}).match({'id': '$id'});
  }

  @override
  Future<List<RemoteEmployedModel>> getEmployees() async {
    List<RemoteEmployedModel> list = [];
    final a = await supabase.from(tableName).select('*').eq('isDeleted', false)
        as List;
    list = a.map((i) => RemoteEmployedModel.fromJson(i)).toList();
    return list;
  }

  @override
  Future<void> updateEmployed(
      {required int id, required RemoteEmployedModel model}) async {
    await supabase.from(tableName).update(model.toJson()).match({'id': '$id'});
  }

  Future<int> getMaxRemoteId() async {
    final maxId = await supabase
        .from(tableName)
        .select('id')
        .order('id', ascending: false)
        .limit(1) as List;
    return maxId[0]['id'] as int;
  }

  @override
  Future<List<RemoteEmployedModel>> getNewEmployees({required int id}) async {
    List<RemoteEmployedModel> list = [];
    final a = await supabase
        .from(tableName)
        .select('*')
        .eq('isDeleted', false)
        .gt('id', id) as List;
    list = a.map((i) => RemoteEmployedModel.fromJson(i)).toList();
    return list;
  }
}
