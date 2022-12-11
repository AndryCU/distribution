import 'package:distribution/common/general_strings.dart';
import 'package:distribution/features/core/strings_ui.dart';
import 'package:distribution/features/crud_employeed/data/model/remote_employe_model.dart';
import 'package:distribution/features/crud_employeed/presentation/pages/crud_employed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import '../../../../main_ui/pages/main_page.dart';
import '../state/riverpood.dart';

GetIt sl = GetIt.instance;

enum Sexo { Masculino, Femenino }

class AddEmployedDialog extends ConsumerStatefulWidget {
  AddEmployedDialog({super.key, RemoteEmployedModel? this.model});
  RemoteEmployedModel? model;

  @override
  _AddEmployedDialogTestState createState() => _AddEmployedDialogTestState();
}

class _AddEmployedDialogTestState extends ConsumerState<AddEmployedDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameEmployedController = TextEditingController();
  final numberChildrenEmployedController = TextEditingController();
  List<String> listItemCat = ['RGA', 'Cuadro', 'Cat 1', 'Cat 2'];
  List<String> listItemResidence = [
    StringsUIEmployed.intern,
    StringsUIEmployed.extern
  ];
  List<String> listSexItems = [
    StringsUIEmployed.male,
    StringsUIEmployed.female
  ];
  String? catSelected = '';
  String? residenceSelected = '';
  String? sexSelected = '';
  @override
  void initState() {
    RemoteEmployedModel? model = widget.model;
    if (model == null) {
      catSelected = null;
      residenceSelected = null;
      sexSelected = null;
      nameEmployedController.text = "";
      numberChildrenEmployedController.text = "";
    } else {
      nameEmployedController.text = model.fullName;
      catSelected = model.catEmp;
      residenceSelected = model.residence;
      numberChildrenEmployedController.text = model.numberChildren.toString();
      sexSelected = model.gender;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameEmployedController.dispose();
    numberChildrenEmployedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RemoteEmployedModel? model = widget.model;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      //TODO annadir libreria para que sea responsive despues de probar en varios telefonos, ancho y largo de los elemnetos y tamanno del texo
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 73,
                  child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? GeneralStrings.requiderValue : null,
                      controller: nameEmployedController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
                      ],
                      decoration: textFieldDecoration(hintText: 'Nombre')),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 73,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return GeneralStrings.requiderValue;
                        } else {
                          return null;
                        }
                      },
                      value: catSelected,
                      alignment: AlignmentDirectional.centerEnd,
                      borderRadius: BorderRadius.circular(12),
                      decoration: InputDecoration(
                          labelText: 'Categoría',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      items: listItemCat.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        catSelected = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 73,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return GeneralStrings.requiderValue;
                        } else {
                          return null;
                        }
                      },
                      value: residenceSelected,
                      borderRadius: BorderRadius.circular(12),
                      decoration: InputDecoration(
                          labelText: 'Residencia',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      items: listItemResidence.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        residenceSelected = value;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 73,
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null) {
                          return GeneralStrings.requiderValue;
                        }
                        if (value.isEmpty) {
                          return GeneralStrings.requiderValue;
                        }
                        if (int.parse(value) > 10) {
                          return StringsUIEmployed.errorMaxChildrens;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: numberChildrenEmployedController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[1-9][0-9]*'))
                      ],
                      decoration:
                          textFieldDecoration(hintText: "Cantidad de hijos")),
                ),
                SizedBox(
                  height: 73,
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null) {
                          return StringsUIEmployed.selectSexError;
                        } else {
                          return null;
                        }
                      },
                      value: sexSelected,
                      borderRadius: BorderRadius.circular(12),
                      decoration: InputDecoration(
                          labelText: 'Sexo',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      items: listSexItems.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) {
                        sexSelected = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (model == null) {
                            RemoteEmployedModel model = RemoteEmployedModel(
                                id: -1,
                                version: 1,
                                catEmp: catSelected!,
                                fullName: nameEmployedController.text,
                                gender: sexSelected!,
                                numberChildren: int.parse(
                                    numberChildrenEmployedController.text),
                                residence: residenceSelected!,
                                isDeleted: false);
                            const snackBar = SnackBar(
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                              content: Text('Creado con exito'),
                            );
                            final snackBar2 = SnackBar(
                              backgroundColor: Colors.grey,
                              duration: Duration(seconds: 16),
                              content: Row(
                                children: [Text('Creando'), Icon(Icons.upload)],
                              ),
                            );
                            ref
                                .read(listEmployedController.notifier)
                                .addEmployed(model)
                                .onError((error, stackTrace) {
                              const snackBarError = SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text('Ha ocurrido un error'),
                                //FIXME si ocurre un error lo muestra bien,
                                //PERO, me muestra el mensaje de creado con exito :(
                              );
                              ScaffoldMessenger.of(scaffoldKey.currentContext!)
                                  .showSnackBar(snackBarError);
                            }).whenComplete(() {
                              ScaffoldMessenger.of(scaffoldKey.currentContext!)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            });
                            ScaffoldMessenger.of(scaffoldKey.currentContext!)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar2);

                            //TODO mostrar snackbar cuando se complete la accion y las otras operaciones del crud
                          } else {
                            RemoteEmployedModel modelAdd = RemoteEmployedModel(
                                id: widget.model!.id,
                                version: model.version! + 1,
                                catEmp: catSelected!,
                                fullName: nameEmployedController.text,
                                gender: sexSelected!,
                                numberChildren: int.parse(
                                    numberChildrenEmployedController.text),
                                residence: residenceSelected!,
                                isDeleted: false);
                            ref
                                .read(listEmployedController.notifier)
                                .updateEmployed(model.id, modelAdd);
                          }
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          model == null
                              ? const Icon(Icons.add)
                              : const Icon(Icons.edit_rounded),
                          const SizedBox(
                            width: 10.0,
                          ),
                          model == null
                              ? const Text(GeneralStrings.addText)
                              : const Text(GeneralStrings.updateText)
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration textFieldDecoration({required String hintText}) {
  return InputDecoration(
    labelText: hintText,
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.only(right: 15, left: 15),
  );
}
