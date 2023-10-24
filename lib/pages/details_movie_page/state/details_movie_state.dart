import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/models.dart';

part 'details_movie_state.freezed.dart';
part 'details_movie_state.g.dart';

@freezed
class DetailsMovieState with _$DetailsMovieState {
  const factory DetailsMovieState({
    required MovieModel? selectedMovie,
  }) = _DetailsMovieState;

  factory DetailsMovieState.fromJson(Map<String, dynamic> json) => _$DetailsMovieStateFromJson(json);
}
