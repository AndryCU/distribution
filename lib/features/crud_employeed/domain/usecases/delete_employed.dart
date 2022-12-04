import 'package:distribution/features/crud_employeed/domain/repositories/employed_repository.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/local_employed_repository.dart';

class DeleteEmployedUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;
  DeleteEmployedUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);

  Future<void> deleteEmployed(int id) async {
    await _remoteEmployedRepository.deleteEmployed(id: id);
    await _localEmployedRepository.deleteEmployed(id: id);
  }
}
