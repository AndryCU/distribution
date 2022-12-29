import 'package:distribution/common/consts.dart';
import 'package:distribution/common/general_strings.dart';
import 'package:distribution/features/crud_products/domain/entities/isar_products_entity.dart';
import 'package:distribution/features/crud_products/presentation/state/riverpood_product.dart';
import 'package:distribution/features/crud_products/presentation/widgets/add_product_dialog.dart';
import 'package:distribution/features/crud_products/presentation/widgets/product_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets.dart';

class ItemProductList extends ConsumerWidget {
  ItemProductList({super.key, required this.product});
  LocalProduct product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${ProductStringsUI.productPrice} ${product.price}',
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${ProductStringsUI.category} ${product.category.value!.name_cat}',
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddProductDialog(
                    localProduct: product,
                  );
                },
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(ProductStringsUI.deletedQuestion),
                    actions: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(GeneralStrings.cancelText),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ref
                                .read(listProductController.notifier)
                                .deleteProduct(product.id)
                                .then(
                                  (value) => showSnackBar(
                                      message:
                                          ProductStringsUI.deletedSuccessfully,
                                      color: Colors.green,
                                      seconds: successSnackBarTime),
                                )
                                .onError(
                                  (error, stackTrace) => showSnackBar(
                                      message: ProductStringsUI.deletedError,
                                      color: Colors.red,
                                      seconds: errorSnackBarTime),
                                );
                            showSnackBar(
                              message: ProductStringsUI.deletedLoading,
                              color: Colors.blue,
                              seconds: loadingSnackBarTime,
                            );
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
