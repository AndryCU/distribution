import 'package:distribution/features/core/strings_ui.dart';
import 'package:distribution/features/crud_employeed/presentation/state/riverpood.dart';
import 'package:distribution/features/crud_employeed/presentation/widgets/add_employed_dialog.dart';
import 'package:distribution/features/crud_employeed/presentation/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class CRUDEmployed extends ConsumerWidget {
  CRUDEmployed({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double queryData = MediaQuery.of(context).size.height;

    //ref.read(ticketsController.notifier).asd();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: IconButton(
        color: Colors.blue,
        icon: Icon(Icons.person_add_alt, size: queryData * 0.06),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddEmployedDialog(),
          );
        },
      ),
      body: ref.watch(listEmployedController).when(
          data: (list) {
            if (list.isEmpty) {
              return const Center(
                child: Text(StringsUIEmployed.employeesNotFound),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemListCustom(
                      queryData: queryData, model: list[index]);
                },
                itemCount: list.length,
              );
            }
          },
          error: (err, stack) => const Center(
              child: Text('Ha ocurrido un error en la conexion de red')),
          loading: (() => const Center(child: CircularProgressIndicator()))),
    );
  }
}
