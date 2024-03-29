import '../../data/model/remote_employe_model.dart';
import '../repositories/employed_repository.dart';
import '../repositories/local_employed_repository.dart';

class AddEmployedUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;
  AddEmployedUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);

  Future<int> addEmployed(RemoteEmployedModel employedModel) async {
    final idIsar = await _remoteEmployedRepository.createEmployed(
        employedModel: employedModel);
    await _localEmployedRepository.createEmployed(
        employedModel: employedModel, id: idIsar);
    return idIsar;
  }
}
