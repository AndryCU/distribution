import 'dart:async';

import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/employed_repository.dart';
import 'dart:io';

import 'package:distribution/features/crud_employeed/domain/repositories/local_employed_repository.dart';

class RemoteListEmployedUseCase {
  final RemoteEmployedRepository _remoteEmployedRepository;
  final LocalEmployedRepository _localEmployedRepository;
  RemoteListEmployedUseCase(
      this._remoteEmployedRepository, this._localEmployedRepository);

  Future<List<RemoteEmployedModel>> getEmployees() async {
    print('Use case call');
    return _localEmployedRepository.getEmployees();
  }
}
