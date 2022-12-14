import '../../data/model/remote_employe_model.dart';

abstract class LocalEmployedRepository {
  Future<List<RemoteEmployedModel>> getEmployees();
  Future<void> createEmployed(
      {required RemoteEmployedModel employedModel, required int id});
  Future<void> deleteEmployed({required int id});
  Future<void> updateEmployed({required RemoteEmployedModel model});
  Future<int> getMaxId();
  Future<void> createMultiplesEmployees(List<RemoteEmployedModel> list);
}
