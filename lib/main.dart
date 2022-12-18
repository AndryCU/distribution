import 'features/configuration/presentation/pages/configuration_page.dart';
import 'features/crud_employeed/presentation/pages/crud_employed.dart';
import 'injection/localtor.dart';
import 'main_ui/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'features/crud_employeed/domain/usecases/sync_use_case.dart';
import 'features/crud_employeed/presentation/state/riverpood.dart';
import 'main_ui/routes.dart';

void main() async {
  //TODO IDEA  SYNC
  /*
  la idea es que que la app abra con intenet, para garantizar que las operaciones de CRUD se vayan a 
  supabase, y trabajar las consultas de ventas y todos los datos a mostrar offline
  -Cuando el usuario abra la app, verifico si hay internet y sync los datos, verificando si hay nuevos registros,
  y falta pensar como hacer lo de actu (hasta ahora la idea seria una comulna true o false)
  -Los eliminados seria una columna deleted, false, que no se pueden borrar de la bd, sino que quedarian
  deshabilitados, pq igual se deben mostrar sus compras
  */
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //home: MainUI(child: Container()),
      //debugShowCheckedModeBanner: false,
      //routerDelegate: route.routerDelegate,
      //routeInformationParser: route.routeInformationParser,
      routerConfig: route,
    );
  }
}
