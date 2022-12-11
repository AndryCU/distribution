import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/employed_repository.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/local_employed_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../controller/employed_list_controller.dart';

GetIt sl = GetIt.instance;

final listEmployes = FutureProvider<List<RemoteEmployedModel>>((ref) async {
  final list = await sl.get<LocalEmployedRepository>().getEmployees();
  return list;
});

final listEmployedController = StateNotifierProvider<EmployedController,
    AsyncValue<List<RemoteEmployedModel>>>((ref) {
  return EmployedController(ref);
});

final isVisibleFAB = StateProvider<bool>(
  (ref) => true,
);
