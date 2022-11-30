import 'package:distribution/common/general_strings.dart';
import 'package:distribution/features/core/strings_ui.dart';
import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/presentation/state/riverpood.dart';
import 'package:distribution/features/crud_employeed/presentation/widgets/add_employed_dialog.dart';
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
                      title: const Text(StringsUI.questionDeletedAlertDialog),
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
                                var snackBar = SnackBar(
                                    elevation: 2.0,
                                    duration: const Duration(seconds: 3),
                                    backgroundColor: Colors.green,
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        Text(StringsUI.deletedSuccessfullyText),
                                      ],
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              });
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
              )),
        ],
      ),
    );
  }
}
