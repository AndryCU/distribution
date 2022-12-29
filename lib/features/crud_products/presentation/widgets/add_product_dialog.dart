import 'package:distribution/common/consts.dart';
import 'package:distribution/common/general_strings.dart';
import 'package:distribution/common/widgets.dart';
import 'package:distribution/features/crud_category/domain/entities/category_entity.dart';
import 'package:distribution/features/crud_category/presentation/state/category_state.dart';
import 'package:distribution/features/crud_products/domain/entities/isar_products_entity.dart';
import 'package:distribution/features/crud_products/domain/entities/products_entity.dart';
import 'package:distribution/features/crud_products/presentation/state/riverpood_product.dart';
import 'package:distribution/features/crud_products/presentation/widgets/product_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class AddProductDialog extends ConsumerStatefulWidget {
  AddProductDialog({super.key, this.localProduct});
  LocalProduct? localProduct;
  @override
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends ConsumerState<AddProductDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameProductController = TextEditingController();
  final _priceProductController = TextEditingController();
  Category? catSelected;
  LocalProduct? localProduct;
  @override
  void initState() {
    localProduct = widget.localProduct;
    if (localProduct == null) {
      catSelected == null;
      _nameProductController.text = "";
      _priceProductController.text = "";
    } else {
      final localCat = widget.localProduct!.category.value;
      catSelected = Category(
        id: localCat!.id,
        name_cat: localCat.name_cat,
        isDeleted: localCat.isDeleted,
        version: localCat.version,
      );
      _nameProductController.text = widget.localProduct!.name;
      _priceProductController.text = widget.localProduct!.price.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? GeneralStrings.requiredValue : null,
                  decoration: textFieldDecoration(
                      hintText: ProductStringsUI.productName),
                  controller: _nameProductController,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? GeneralStrings.requiredValue : null,
                  controller: _priceProductController,
                  decoration: textFieldDecoration(
                      hintText: ProductStringsUI.productPrice),
                ),
                ref.watch(listCategoryController).when(
                      data: (snapshot) {
                        if (snapshot.isEmpty) {
                          return const Text('Vacia');
                        }
                        //catSelected = snapshot.first;
                        final categories = snapshot.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.name_cat),
                          );
                        }).toList();
                        return DropdownButtonFormField<Category>(
                          value: catSelected,
                          items: categories,
                          onChanged: (cat) {
                            catSelected = cat;
                          },
                          alignment: AlignmentDirectional.centerEnd,
                        );
                      },
                      error: (error, stackTrace) => Text('Error'),
                      loading: () => const Text('Cargando'),
                    ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: (() =>
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog')),
                        child: const Text(GeneralStrings.cancelText),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (localProduct == null) {
                              ref
                                  .read(listProductController.notifier)
                                  .addProduct(
                                    Product(
                                        price: double.parse(
                                            _priceProductController.text),
                                        name: _nameProductController.text,
                                        idCat: catSelected!.id!,
                                        isDeleted: false,
                                        version: 1),
                                  )
                                  .then((value) => showSnackBar(
                                      message: 'Producto creado OK',
                                      color: Colors.green,
                                      seconds: successSnackBarTime))
                                  .onError(
                                    (error, stackTrace) => showSnackBar(
                                        message: 'Error producto',
                                        color: Colors.red,
                                        seconds: errorSnackBarTime),
                                  );
                              showSnackBar(
                                  message: 'Creando producto',
                                  color: Colors.blue,
                                  seconds: loadingSnackBarTime);
                            } else {
                              ref
                                  .read(listProductController.notifier)
                                  .updateProduct(Product(
                                      id: localProduct!.id,
                                      price: double.parse(
                                          _priceProductController.text),
                                      name: _nameProductController.text,
                                      idCat: catSelected!.id!,
                                      isDeleted: localProduct!.isDeleted,
                                      version: localProduct!.version))
                                  .then((value) => showSnackBar(
                                      message: 'Actualizado ok producto',
                                      color: Colors.green,
                                      seconds: successSnackBarTime))
                                  .onError((error, stackTrace) => showSnackBar(
                                      message: 'Error actualizando producto',
                                      color: Colors.red,
                                      seconds: errorSnackBarTime));

                              showSnackBar(
                                  message: 'Actualizando produto',
                                  color: Colors.blue,
                                  seconds: loadingSnackBarTime);
                            }
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          }
                        },
                        child: localProduct == null
                            ? const Text(GeneralStrings.addText)
                            : const Text(GeneralStrings.updateText),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
