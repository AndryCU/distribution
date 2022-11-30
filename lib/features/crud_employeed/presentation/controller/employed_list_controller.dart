import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/employed_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/add_remote_employe_use_case.dart';

GetIt sl = GetIt.instance;

class EmployedController
    extends StateNotifier<AsyncValue<List<RemoteEmployedModel>>> {
  EmployedController() : super(const AsyncValue.loading()) {
    getEmployees();
  }

  Future<void> getEmployees() async {
    try {
      state = const AsyncValue.loading();
      final employees = await sl.get<RemoteEmployedRepository>().getEmployees();
      if (mounted) {
        state = AsyncValue.data(employees);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> addEmployed(RemoteEmployedModel model) async {
    sl.get<AddEmployeUseCase>().addEmployed(model);
    state.whenData((employees) {
      state = AsyncValue.data([...employees, model]);
    });
  }

  Future<void> deleteEmployed(int id) async {
    sl.get<RemoteEmployedRepository>().deleteEmployed(id: id);
    state.whenData((employees) {
      employees.removeWhere((element) => element.id == id);
      state = AsyncValue.data(employees);
    });
  }

  Future<void> updateEmployed(int id, RemoteEmployedModel model) async {
    sl.get<RemoteEmployedRepository>().updateEmployed(model: model, id: id);
    state.whenData((employees) {
      employees[employees.indexWhere((element) => element.id == model.id)] =
          model;
      state = AsyncValue.data(employees);
    });
  }
}
