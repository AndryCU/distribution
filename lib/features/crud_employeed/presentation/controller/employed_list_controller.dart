import '../../data/model/remote_employe_model.dart';
import '../../domain/repositories/local_employed_repository.dart';
import '../../domain/usecases/delete_employed.dart';
import '../../domain/usecases/sync_use_case.dart';
import '../../domain/usecases/update_employed_use_case.dart';
import '../state/riverpood.dart';
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
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> syncEmployees() async {
    try {
      state = const AsyncValue.loading();
      final newEmployees = await sl.get<SyncEmployedUseCase>().syncEmployees();
      state.whenData((value) {
        state = AsyncValue.data([...value, ...newEmployees]);
      });
      _ref.invalidate(listEmployedController);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> addEmployed(RemoteEmployedModel model) async {
    final id = await sl.get<AddEmployedUseCase>().addEmployed(model);
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
    await sl.get<UpdateEmployedUseCase>().updateEmployed(id, model);
    state.whenData((employees) {
      employees[employees.indexWhere((element) => element.id == model.id)] =
          model;
      state = AsyncValue.data(employees);
    });
  }
}
