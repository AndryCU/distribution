import '../../data/model/remote_employe_model.dart';
import '../../../../utils/chec_internet_connection.dart';

import '../repositories/employed_repository.dart';
import '../repositories/local_employed_repository.dart';

class SyncEmployedUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;

  SyncEmployedUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);
  Future<List<RemoteEmployedModel>> syncEmployees() async {
    List<RemoteEmployedModel> list_new_employes = [];
    if (await CheckInternetConnection.checkIfHaveInternet()) {
      final maxLocalId = await _localEmployedRepository.getMaxId();
      final maxRemoteId = await _remoteEmployedRepository.getMaxRemoteId();
      if (maxRemoteId > maxLocalId) {
        list_new_employes =
            await _remoteEmployedRepository.getNewEmployees(id: maxLocalId);
        await _localEmployedRepository
            .createMultiplesEmployees(list_new_employes);
      }
    }
    //TODO hacer el sync para cuando se actutalice, la idea es con un atributo version
    return list_new_employes;
  }
}
