import 'dart:io';

import 'package:distribution/common/consts.dart';
import 'package:distribution/features/core/snackbar_widget.dart';
import 'package:distribution/features/crud_category/presentation/widgets/category_strings.dart';

import '../../domain/entities/category_entity.dart';
import '../state/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/general_strings.dart';

class AddCategoryDialog extends ConsumerStatefulWidget {
  AddCategoryDialog({super.key, Category? this.model});
  Category? model;

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends ConsumerState<AddCategoryDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameCategoryController = TextEditingController();
  @override
  void initState() {
    if (widget.model != null) {
      nameCategoryController.text = widget.model!.name_cat;
    } else {
      nameCategoryController.text = "";
    }
    super.initState();
  }

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text(CategoryStringsUI.name),
                    contentPadding: EdgeInsets.only(right: 15, left: 15),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? GeneralStrings.requiredValue : null,
                  controller: nameCategoryController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(GeneralStrings.regularExpressionText),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        },
                        child: const Text(GeneralStrings.cancelText)),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.model == null) {
                            ref
                                .read(listCategoryController.notifier)
                                .addCategory(
                                  Category(
                                      id: -1,
                                      name_cat: nameCategoryController.text,
                                      isDeleted: false,
                                      version: 1),
                                )
                                .then(
                              (value) {
                                showSnackBar(
                                  message: CategoryStringsUI.addSuccessfully,
                                  color: Colors.green,
                                  seconds: successSnackBarTime,
                                );
                              },
                            ).onError((error, stackTrace) {
                              showSnackBar(
                                  message: CategoryStringsUI.addError,
                                  color: Colors.red,
                                  seconds: errorSnackBarTime);
                            });
                            showSnackBar(
                              message: CategoryStringsUI.loadingAdd,
                              color: Colors.blue,
                              seconds: loadingSnackBarTime,
                            );
                          } else {
                            ref
                                .read(listCategoryController.notifier)
                                .updateCategory(
                                  Category(
                                    id: widget.model!.id,
                                    name_cat: nameCategoryController.text,
                                    isDeleted: widget.model!.isDeleted,
                                    version: widget.model!.version + 1,
                                  ),
                                )
                                .then(
                                  (value) => showSnackBar(
                                      message: CategoryStringsUI
                                          .updatingSuccessfully,
                                      color: Colors.green,
                                      seconds: successSnackBarTime),
                                )
                                .onError(
                                  (error, stackTrace) => showSnackBar(
                                      message: CategoryStringsUI.errorUpdate,
                                      color: Colors.red,
                                      seconds: errorSnackBarTime),
                                );
                            showSnackBar(
                              message: CategoryStringsUI.loadingUpdate,
                              color: Colors.blue,
                              seconds: loadingSnackBarTime,
                            );
                          }
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        }
                      },
                      child: Text(
                        nameCategoryController.text.isEmpty
                            ? GeneralStrings.addText
                            : GeneralStrings.updateText,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
