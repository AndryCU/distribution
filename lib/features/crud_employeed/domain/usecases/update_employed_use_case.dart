import 'dart:ffi';

import 'package:get_it/get_it.dart';

import '../../data/model/remote_employe_model.dart';
import '../repositories/employed_repository.dart';
import '../repositories/local_employed_repository.dart';

class UpdateEmployedUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;

  UpdateEmployedUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);

  Future<void> updateEmployed(int id, RemoteEmployedModel model) async {
    await _remoteEmployedRepository.updateEmployed(id: id, model: model);
    await _localEmployedRepository.updateEmployed(model: model);
  }
}
