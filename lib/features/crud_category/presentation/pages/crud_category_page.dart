import '../../domain/entities/category_entity.dart';
import '../state/category_state.dart';
import '../widgets/add_dialog_category.dart';
import '../widgets/item_category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class CRUDCategory extends ConsumerWidget {
  const CRUDCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double queryData = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddCategoryDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ref.watch(listCategoryController).when(
        data: (list) {
          if (list.isEmpty) {
            return const Center(
              child: Text('No hay registradas categorias'),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return CustomItemListCategory(list[index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Colors.grey);
                },
                itemCount: list.length);
          }
        },
        error: (error, stackTrace) {
          return const Center(child: Text('Ha ocurrido un error!'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
