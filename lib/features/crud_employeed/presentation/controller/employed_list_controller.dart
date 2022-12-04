import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/domain/repositories/local_employed_repository.dart';
import 'package:distribution/features/crud_employeed/domain/usecases/delete_employed.dart';
import 'package:distribution/features/crud_employeed/domain/usecases/sync_use_case.dart';
import 'package:distribution/features/crud_employeed/domain/usecases/update_employed_use_case.dart';
import 'package:distribution/features/crud_employeed/presentation/state/riverpood.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/add_employe_use_case.dart';

GetIt sl = GetIt.instance;

class EmployedController
    extends StateNotifier<AsyncValue<List<RemoteEmployedModel>>> {
  EmployedController(this._ref) : super(const AsyncValue.loading()) {
    getEmployees();
  }
  final Ref _ref;
  Future<void> getEmployees() async {
    try {
      state = const AsyncValue.loading();
      final employees = await sl.get<LocalEmployedRepository>().getEmployees();
      if (mounted) {
        state = AsyncValue.data(employees);
      }
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> syncEmployees() async {
    state = const AsyncValue.loading();
    final new_employees = await sl.get<SyncEmployedUseCase>().syncEmployees();
    state.whenData((value) {
      state = AsyncValue.data([...value, ...new_employees]);
    });
    _ref.invalidate(listEmployedController);
  }

  Future<void> addEmployed(RemoteEmployedModel model) async {
    final id = await sl.get<AddEmployeUseCase>().addEmployed(model);
    final d = model.copyWith(id: id);
    state.whenData((employees) {
      state = AsyncValue.data([...employees, d]);
    });
  }

  Future<void> deleteEmployed(int id) async {
    await sl.get<DeleteEmployedUseCase>().deleteEmployed(id);
    state.whenData((employees) {
      employees.removeWhere((element) => element.id == id);
      state = AsyncValue.data(employees);
    });
  }

  Future<void> updateEmployed(int id, RemoteEmployedModel model) async {
    //TODO verificar que existan cambios en el modelo para no hacer llamadas por gusto, implementar el equal
    sl.get<UpdateEmployedUseCase>().updateEmployed(id, model);
    state.whenData((employees) {
      employees[employees.indexWhere((element) => element.id == model.id)] =
          model;
      state = AsyncValue.data(employees);
    });
  }
}
