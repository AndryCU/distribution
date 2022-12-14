import 'dart:async';

import '../../data/model/remote_employe_model.dart';

import '../repositories/local_employed_repository.dart';

class RemoteListEmployedUseCase {
  final LocalEmployedRepository _localEmployedRepository;
  RemoteListEmployedUseCase(this._localEmployedRepository);

  Future<List<RemoteEmployedModel>> getEmployees() async {
    return _localEmployedRepository.getEmployees();
  }
}
