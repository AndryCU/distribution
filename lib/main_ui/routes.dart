import 'package:distribution/features/configuration/presentation/pages/configuration_page.dart';
import 'package:distribution/features/crud_employeed/presentation/pages/crud_employed.dart';
import 'package:distribution/features/sales/presentation/pages/sales_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/main_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter route = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/sales_page',
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MainUI(child: child);
          },
          routes: [
            GoRoute(
              path: '/sales_page',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: SalesPage(),
                );
              },
            ),
            GoRoute(
              path: '/settings_page',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: ConfigurationPage(),
                );
              },
              routes: [
                GoRoute(
                  path: 'crud_employed_page',
                  builder: (BuildContext context, GoRouterState state) {
                    return CRUDEmployed();
                  },
                ),
                GoRoute(
                  path: 'crud_categories_page',
                  builder: (BuildContext context, GoRouterState state) {
                    return Container(
                      child: Center(child: Text('Categories')),
                    );
                  },
                ),
              ],
            ),
          ])
    ]);
