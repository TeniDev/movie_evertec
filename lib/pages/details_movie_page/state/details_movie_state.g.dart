// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_movie_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailsMovieStateImpl _$$DetailsMovieStateImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailsMovieStateImpl(
      selectedMovie: json['selectedMovie'] == null
          ? null
          : MovieModel.fromJson(json['selectedMovie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailsMovieStateImplToJson(
        _$DetailsMovieStateImpl instance) =>
    <String, dynamic>{
      'selectedMovie': instance.selectedMovie,
    };
