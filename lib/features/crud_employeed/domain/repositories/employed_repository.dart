import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';

abstract class RemoteEmployedRepository {
  Future<List<RemoteEmployedModel>> getEmployees();
  Future<int> createEmployed({required RemoteEmployedModel employedModel});
  Future<void> deleteEmployed({required int id});
  Future<void> updateEmployed(
      {required int id, required RemoteEmployedModel model});
  Future<int> getMaxRemoteId();
  Future<List<RemoteEmployedModel>> getNewEmployees({required int id});
}
