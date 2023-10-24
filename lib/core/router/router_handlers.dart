part of 'router_config.dart';

Widget _homeHandler(BuildContext context, GoRouterState state, Widget child) {
  return HomePage(
    child: child,
  );
}

Page<Widget> _moviesHandler(
  BuildContext context,
  GoRouterState state,
) {
  return const NoTransitionPage(
    child: MoviesPage(),
  );
}

Page<Widget> _settingsHandler(
  BuildContext context,
  GoRouterState state,
) {
  return const NoTransitionPage(
    child: SettingsPage(),
  );
}

Widget _detailsMovieHandler(BuildContext context, GoRouterState state) {
  return const DetailsMoviePage();
}

Widget _searchHandler(BuildContext context, GoRouterState state) {
  return const SearchPage();
}
