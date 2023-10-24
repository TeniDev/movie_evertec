import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';
import 'routes_names.dart';

part 'router_handlers.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return _appRouter;
});

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

final _appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutesNames.movies,
  routes: [
    ShellRoute(
      navigatorKey: homeNavigatorKey,
      builder: _homeHandler,
      routes: [
        GoRoute(
          path: RoutesNames.movies,
          parentNavigatorKey: homeNavigatorKey,
          pageBuilder: _moviesHandler,
        ),
        GoRoute(
          path: RoutesNames.settings,
          parentNavigatorKey: homeNavigatorKey,
          pageBuilder: _settingsHandler,
        ),
      ],
    ),
    GoRoute(
      path: RoutesNames.movieDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: _detailsMovieHandler,
    ),
    GoRoute(
      path: RoutesNames.search,
      parentNavigatorKey: rootNavigatorKey,
      builder: _searchHandler,
    ),
  ],
);
