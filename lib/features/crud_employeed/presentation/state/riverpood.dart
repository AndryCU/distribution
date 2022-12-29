import '../../data/model/remote_employe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../controller/employed_list_controller.dart';

GetIt sl = GetIt.instance;

final listEmployedController = StateNotifierProvider<EmployedController,
    AsyncValue<List<RemoteEmployedModel>>>((ref) {
  return EmployedController(ref);
});

final isVisibleFAB = StateProvider<bool>(
  (ref) => true,
);
