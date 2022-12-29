import 'package:distribution/features/crud_products/presentation/widgets/add_product_dialog.dart';
import 'package:distribution/features/crud_products/presentation/widgets/itemProductList.dart';
import 'package:distribution/features/crud_products/presentation/widgets/product_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../../../main_ui/pages/main_page.dart';
import '../state/riverpood_product.dart';

GetIt sl = GetIt.instance;

class CRUDProduct extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                ref.read(listProductController.notifier).syncProducts();
              },
              icon: const Icon(Icons.update),
            )
          ],
        ),
        floatingActionButton: ref.watch(isVisibleFabProducts)
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: scaffoldKey.currentContext!,
                    builder: (context) => AddProductDialog(),
                  );
                },
                child: const Icon(Icons.fastfood),
              )
            : null,
        body: ref.watch(listProductController).when(
          data: (products) {
            if (products.isEmpty) {
              return const Center(
                child: Text(ProductStringsUI.emptyList),
              );
            } else {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  if (notification.direction == ScrollDirection.forward) {
                    ref.read(isVisibleFabProducts.notifier).state = true;
                  }
                  if (notification.direction == ScrollDirection.reverse) {
                    ref.read(isVisibleFabProducts.notifier).state = false;
                  }
                  return true;
                },
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemProductList(product: products[index]);
                    },
                    separatorBuilder: (_, __) => const Divider(
                          color: Colors.grey,
                        ),
                    itemCount: products.length),
              );
            }
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text(ProductStringsUI.errorList),
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
