import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/models.dart';

part 'search_state.freezed.dart';
part 'search_state.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<MovieModel>? movies,
    required int currentPageRequested,
  }) = _SearchState;

  factory SearchState.fromJson(Map<String, dynamic> json) => _$SearchStateFromJson(json);
}
