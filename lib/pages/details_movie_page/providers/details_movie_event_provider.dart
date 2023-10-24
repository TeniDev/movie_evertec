import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../state/details_movie_state.dart';

final detailsMovieEventProvider = StateNotifierProvider<DetailsMovieEventNotifier, DetailsMovieState>(
  (ref) {
    return DetailsMovieEventNotifier(ref);
  },
);

class DetailsMovieEventNotifier extends StateNotifier<DetailsMovieState> {
  DetailsMovieEventNotifier(this.ref)
      : super(const DetailsMovieState(
          selectedMovie: null,
        ));

  final Ref ref;

  void setSelectedMovie(MovieModel movie) {
    state = state.copyWith(
      selectedMovie: movie,
    );
  }

  void resetState() {
    state = const DetailsMovieState(
      selectedMovie: null,
    );
  }
}
