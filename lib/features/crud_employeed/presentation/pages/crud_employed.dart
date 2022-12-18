import '../widgets/strings_ui.dart';
import '../state/riverpood.dart';
import '../widgets/add_employed_dialog.dart';
import '../widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../main_ui/pages/main_page.dart';

GetIt sl = GetIt.instance;

class CRUDEmployed extends ConsumerWidget {
  CRUDEmployed({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double queryData = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: ref.watch(isVisibleFAB)
          ? FloatingActionButton(
              child: Icon(Icons.person_add_alt, size: queryData * 0.06),
              onPressed: () {
                showDialog(
                  context: scaffoldKey.currentContext!,
                  builder: (context) => AddEmployedDialog(),
                );
              },
            )
          : null,
      body: ref.watch(listEmployedController).when(
          data: (list) {
            if (list.isEmpty) {
              return const Center(
                child: Text(StringsUIEmployed.employeesNotFound),
              );
            } else {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  if (notification.direction == ScrollDirection.forward) {
                    ref.read(isVisibleFAB.notifier).state = true;
                  }
                  if (notification.direction == ScrollDirection.reverse) {
                    ref.read(isVisibleFAB.notifier).state = false;
                  }
                  return true;
                },
                child: ListView.separated(
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
                ),
              );
            }
          },
          error: (err, stack) =>
              const Center(child: Text(StringsUIEmployed.errorListEmployees)),
          loading: (() => Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Cargando datos')
                ],
              )))),
    );
  }
}
