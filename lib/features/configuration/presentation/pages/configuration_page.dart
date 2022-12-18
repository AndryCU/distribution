import '../../../crud_employeed/presentation/state/riverpood.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ConfigurationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text('Actualizar'),
              IconButton(
                icon: const Icon(Icons.sync),
                onPressed: () {
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
              title: const Text('Trabajadores'),
              subtitle: const Text(
                  'Gestione la creacion, modificacion y baja de los trabajadores'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.go('/settings_page/crud_employed_page');
              },
            ),
            ListTile(
              title: const Text('Categoria'),
              subtitle: const Text(
                  'Gestione la creacion, modificacion y eliminacion de las categorias'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.go('/settings_page/crud_categories_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
