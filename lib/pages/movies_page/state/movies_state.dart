import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/models.dart';

part 'movies_state.freezed.dart';
part 'movies_state.g.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    required List<MovieModel>? movies,
    required double currentMovieIndex,
    required int currentPageRequested,
  }) = _MoviesState;

  factory MoviesState.fromJson(Map<String, dynamic> json) =>
      _$MoviesStateFromJson(json);
}
