import 'package:distribution/common/consts.dart';
import 'package:distribution/features/crud_category/presentation/widgets/category_strings.dart';

import '../../../../common/general_strings.dart';
import '../../../core/snackbar_widget.dart';
import '../../domain/entities/category_entity.dart';
import '../state/category_state.dart';
import 'add_dialog_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomItemListCategory extends ConsumerWidget {
  final Category category;

  CustomItemListCategory(this.category);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        category.name_cat,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddCategoryDialog(
                    model: category,
                  );
                },
              );
            },
            icon: const Icon(
              Icons.edit_rounded,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(CategoryStringsUI.questionDeleting),
                    actions: [
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(GeneralStrings.cancelText)),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () {
                            ref
                                .read(listCategoryController.notifier)
                                .deleteCategory(category.id!)
                                .then((value) {
                              showSnackBar(
                                  message:
                                      CategoryStringsUI.deletedSuccessfully,
                                  color: Colors.green,
                                  seconds: successSnackBarTime);
                            }).onError((error, stackTrace) {
                              showSnackBar(
                                  message: CategoryStringsUI.deletedError,
                                  color: Colors.red,
                                  seconds: errorSnackBarTime);
                            });
                            showSnackBar(
                                message: CategoryStringsUI.loadingDelete,
                                color: Colors.blue,
                                seconds: loadingSnackBarTime);
                            Navigator.of(context).pop();
                          },
                          child: const Text(GeneralStrings.acceptText))
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
