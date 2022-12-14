import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/local_db_entity.dart' as local;
import '../../domain/entities/local_db_entity.dart';
import '../../domain/repositories/local_employed_repository.dart';
import '../model/remote_employe_model.dart';

final getIt = GetIt.instance;
final isar = getIt.get<Isar>();

class LocalEmployedRepositoryImplementation implements LocalEmployedRepository {
  @override
  Future<void> deleteEmployed({required int id}) async {
    final employees = isar.employedLocals;
    final employed = await employees.get(id);
    employed!.isDeleted = true;
    await isar.writeTxn(() async {
      await employees.put(employed);
    });
  }

  @override
  Future<List<RemoteEmployedModel>> getEmployees() async {
    final employees =
        await isar.employedLocals.filter().isDeletedEqualTo(false).findAll();
    List<RemoteEmployedModel> list = [];
    employees.forEach((element) {
      list.add(RemoteEmployedModel.fromEmployed(element));
    });
    return list;
  }

  @override
  Future<void> updateEmployed({required RemoteEmployedModel model}) async {
    final employees = isar.employedLocals;
    await isar.writeTxn(() async {
      await employees.put(_createEmployedFromRemoteEmployedModel(model));
    });
  }

  @override
  Future<int> getMaxId() async {
    final employees = await isar.employedLocals.where().findAll();
    return employees.isEmpty ? 0 : employees.last.id;
  }

  EmployedLocal _createEmployedFromRemoteEmployedModel(
      RemoteEmployedModel model) {
    return EmployedLocal()
      ..catEmp = model.catEmp
      ..version = model.version!
      ..fullName = model.fullName
      ..gender = model.gender
      ..id = model.id
      ..numberChildren = model.numberChildren
      ..residence = model.residence;
  }

  @override
  Future<void> createEmployed(
      {required RemoteEmployedModel employedModel, required int id}) async {
    final employees = isar.employedLocals;
    final employed = EmployedLocal()
      ..catEmp = employedModel.catEmp
      ..version = employedModel.version!
      ..fullName = employedModel.fullName
      ..gender = employedModel.gender
      ..id = id
      ..numberChildren = employedModel.numberChildren
      ..residence = employedModel.residence
      ..isDeleted = employedModel.isDeleted;
    await isar.writeTxn(() async {
      await employees.put(employed);
    });
  }

  Future<void> createMultiplesEmployees(
      List<RemoteEmployedModel> listRemote) async {
    final employees = isar.employedLocals;
    List<EmployedLocal> list = [];
    listRemote.forEach((employedModel) {
      list.add(_createEmployedFromRemoteEmployedModel(employedModel));
    });
    await isar.writeTxn(() async {
      await employees.putAll(list);
    });
  }
}
