import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';

abstract class RemoteEmployedRepository {
  Future<List<RemoteEmployedModel>> getEmployees();
  Future<int> createEmployed({required RemoteEmployedModel employedModel});
  void deleteEmployed({required int id});
  void updateEmployed({required int id, required RemoteEmployedModel model});
}
