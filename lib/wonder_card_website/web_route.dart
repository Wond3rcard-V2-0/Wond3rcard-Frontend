import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wonder_card_website/wonder_card_website/views/pages/wondercard_website.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter webRoute = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return WonderCardWebsite();
      },
    ),
  ],
);
