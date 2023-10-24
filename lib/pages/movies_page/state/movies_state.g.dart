// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesStateImpl _$$MoviesStateImplFromJson(Map<String, dynamic> json) =>
    _$MoviesStateImpl(
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentMovieIndex: (json['currentMovieIndex'] as num).toDouble(),
      currentPageRequested: json['currentPageRequested'] as int,
    );

Map<String, dynamic> _$$MoviesStateImplToJson(_$MoviesStateImpl instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'currentMovieIndex': instance.currentMovieIndex,
      'currentPageRequested': instance.currentPageRequested,
    };
