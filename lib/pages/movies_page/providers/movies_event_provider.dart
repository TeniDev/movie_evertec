import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/core/utils/logger.dart';

import '../../../data/providers/providers.dart';
import '../state/movies_state.dart';

final moviesEventProvider = StateNotifierProvider<MoviesEventNotifier, MoviesState>(
  (ref) {
    return MoviesEventNotifier(ref);
  },
);

class MoviesEventNotifier extends StateNotifier<MoviesState> {
  MoviesEventNotifier(this.ref)
      : super(const MoviesState(
          movies: null,
          currentMovieIndex: 0,
          currentPageRequested: 1,
        ));

  final Ref ref;

  Future<void> getUpcomingMovies() async {
    final response = await ref.read(movieRepositoryProvider).getUpcomingMovies(
          language: ref.watch(localeProvider).languageCode,
          page: state.currentPageRequested.toString(),
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
          movies: r,
        );
      },
    );
  }

  void updateMovieIndex(double index) {
    state = state.copyWith(
      currentMovieIndex: index,
    );
  }
}
