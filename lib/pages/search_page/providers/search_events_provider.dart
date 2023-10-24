import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/core/router/router.dart';
import 'package:movie_evertec/core/utils/logger.dart';

import '../../../data/providers/providers.dart';
import '../../details_movie_page/providers/details_movie_providers.dart';
import '../state/search_state.dart';

final searchEventProvider = StateNotifierProvider<SearchEventNotifier, SearchState>(
  (ref) {
    return SearchEventNotifier(ref);
  },
);

class SearchEventNotifier extends StateNotifier<SearchState> {
  SearchEventNotifier(this.ref)
      : super(const SearchState(
          movies: null,
          currentPageRequested: 1,
        ));

  final Ref ref;

  Future<void> searchMovie({
    required String query,
    bool newPage = false,
  }) async {
    final response = await ref.read(movieRepositoryProvider).searchMovie(
          language: ref.watch(localeProvider).languageCode,
          page: (state.currentPageRequested + (newPage ? 1 : 0)).toString(),
          query: query,
        );

    response.fold(
      (l) {
        CustomLogger().error(
          'Error: ${l.httpCode} - ${l.message}',
        );

        state = state.copyWith(
          movies: [],
        );
      },
      (r) {
        state = state.copyWith(
          movies: state.movies != null ? [...state.movies!, ...r] : r,
          currentPageRequested: newPage ? state.currentPageRequested + 1 : state.currentPageRequested,
        );
      },
    );
  }

  void selectDetailMovie(int index) {
    ref.read(detailsMovieEventProvider.notifier).setSelectedMovie(
          state.movies![index],
        );

    ref.read(appRouterProvider).push(
          RoutesNames.movieDetails,
        );
  }

  void resetState() {
    state = const SearchState(
      movies: null,
      currentPageRequested: 1,
    );
  }
}
