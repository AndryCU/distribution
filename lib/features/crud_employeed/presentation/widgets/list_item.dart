import '../../../../common/general_strings.dart';
import '../../../core/snackbar_widget.dart';
import 'strings_ui.dart';
import '../../data/model/remote_employe_model.dart';
import '../state/riverpood.dart';
import 'add_employed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListCustom extends ConsumerWidget {
  ItemListCustom({
    super.key,
    required this.queryData,
    required this.model,
  });

  final double queryData;
  RemoteEmployedModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        model.fullName,
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
                    return AddEmployedDialog(
                      model: model,
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.edit_rounded,
                color: Colors.blue,
              )),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                        StringsUIEmployed.questionDeletedAlertDialog),
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
                                .read(listEmployedController.notifier)
                                .deleteEmployed(model.id)
                                .then((value) {
                              showSnackBar(
                                  message:
                                      StringsUIEmployed.deletedSuccessfullyText,
                                  color: Colors.green,
                                  seconds: 4);
                            }).timeout(
                              const Duration(seconds: 15),
                              onTimeout: () {
                                showSnackBar(
                                    message: StringsUIEmployed.connectionError,
                                    color: Colors.red,
                                    seconds: 4);
                              },
                            ).onError((error, stackTrace) {
                              showSnackBar(
                                  message: StringsUIEmployed.error,
                                  color: Colors.red,
                                  seconds: 4);
                            });
                            showSnackBar(
                                message: StringsUIEmployed.loadingDeleting,
                                color: Colors.blue,
                                seconds: 16);
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
