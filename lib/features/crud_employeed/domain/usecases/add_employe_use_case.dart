import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/employed_repository.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/local_employed_repository.dart';

import '../entities/local_db_entity.dart';

class AddEmployeUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;
  AddEmployeUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);

  Future<int> addEmployed(RemoteEmployedModel _employedModel) async {
    final idIsar = await _remoteEmployedRepository.createEmployed(
        employedModel: _employedModel);
    await _localEmployedRepository.createEmployed(
        employedModel: _employedModel, id: idIsar);
    return idIsar;
  }
}
