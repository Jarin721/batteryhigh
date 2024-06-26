import '/src/features/cart/presentation/pages/cart.dart';
import '/src/features/home/presentation/pages/home.dart';
import '/src/features/settings/presentation/pages/settings.dart';
import 'package:battery_high/src/features/cart/presentation/pages/cart.dart';
import 'package:battery_high/src/features/home/presentation/pages/home.dart';
import 'package:battery_high/src/features/settings/presentation/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/ScaffoldWithNavBar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return MyHomePage(
              title: 'Homepage',
              key: state.pageKey,
            );
          },
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: '/cart',
          builder: (BuildContext context, GoRouterState state) {
            return MyCartPage(
              // title: 'Cart Page',
              key: state.pageKey,
            );
          },
        ),

        /// The third screen to display in the bottom navigation bar.
        GoRoute(
          path: '/settings',
          builder: (BuildContext context, GoRouterState state) {
            return MySettingsPage(
              //title: 'Setting Page',
              key: state.pageKey,
            );
          },
        ),
      ],
    ),
  ],
);
