import '../../data/model/remote_employe_model.dart';

import '../repositories/employed_repository.dart';
import '../repositories/local_employed_repository.dart';

class SyncEmployedUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;

  SyncEmployedUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);
  Future<List<RemoteEmployedModel>> syncEmployees() async {
    List<RemoteEmployedModel> listNewEmployees = [];
    final maxLocalId = await _localEmployedRepository.getMaxId();
    final maxRemoteId = await _remoteEmployedRepository.getMaxRemoteId();
    if (maxRemoteId > maxLocalId) {
      listNewEmployees =
          await _remoteEmployedRepository.getNewEmployees(id: maxLocalId);
      await _localEmployedRepository.createMultiplesEmployees(listNewEmployees);
    }
    //TODO hacer el sync para cuando se actutalice, la idea es con un atributo version
    return listNewEmployees;
  }
}
