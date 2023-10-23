import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_state.freezed.dart';
part 'movies_state.g.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState({
    required List<dynamic> movies,
  }) = _MoviesState;

  factory MoviesState.fromJson(Map<String, dynamic> json) => _$MoviesStateFromJson(json);
}
