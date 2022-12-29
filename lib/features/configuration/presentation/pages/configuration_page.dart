import 'package:distribution/features/configuration/presentation/widgets/configurations_strings.dart';
import 'package:distribution/features/crud_category/presentation/state/category_state.dart';
import 'package:distribution/features/crud_employeed/presentation/state/riverpood.dart';
import 'package:distribution/features/crud_products/presentation/state/riverpood_product.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

GetIt getIt = GetIt.instance;

class ConfigurationPage extends ConsumerWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(ConfigurationsStringsUI.updateGeneral),
              IconButton(
                icon: const Icon(Icons.sync),
                onPressed: () {
                  ref.read(listProductController.notifier).syncProducts();
                  ref.read(listEmployedController.notifier).syncEmployees();
                },
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text(ConfigurationsStringsUI.employees),
              subtitle:
                  const Text(ConfigurationsStringsUI.employeesExplanation),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(ConfigurationsStringsUI.employeesRoute),
            ),
            ListTile(
              title: const Text(ConfigurationsStringsUI.category),
              subtitle: const Text(ConfigurationsStringsUI.categoryExplanation),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(ConfigurationsStringsUI.categoryRoute),
            ),
            ListTile(
              title: const Text(ConfigurationsStringsUI.product),
              subtitle: const Text(ConfigurationsStringsUI.productExplanation),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(ConfigurationsStringsUI.productRoute),
            ),
          ],
        ),
      ),
    );
  }
}
