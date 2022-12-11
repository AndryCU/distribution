import 'package:distribution/features/crud_employeed/presentation/pages/crud_employed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ConfigurationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
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
    );
  }
}
