import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/utils.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import '../helpers/helpers.dart';
import '../providers/api_provider.dart';

final movieResourceProvider = Provider<MovieResource>((ref) {
  return _MovieTmdbResource(
    apiHelper: ref.watch(apiProvider),
  );
});

abstract class MovieResource extends MovieRepository {}

class _MovieTmdbResource implements MovieResource {
  _MovieTmdbResource({
    required ApiHelper apiHelper,
  }) : _apiHelper = apiHelper;

  final ApiHelper _apiHelper;

  @override
  Future<Either<ApiException, List<MovieModel>>> getUpcomingMovies({
    String? language,
    String? page,
  }) async {
    final response = await _apiHelper.get(
      'discover/movie',
      queryParameters: {
        'language': language ?? 'es',
        'page': page ?? '1',
        'include_adult': 'false',
        'include_video': 'false',
        'sort_by': 'popularity.desc',
        'with_release_type': '2|3',
        'primary_release_date.gte': DateTime.now().date,
      },
      headers: {
        'Authorization': 'Bearer ${Env.tmdbAccessKey}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final moviesJson = jsonDecode(response.body)['results'] as List;

      List<MovieModel> movies = [];

      for (final element in moviesJson) {
        movies.add(MovieModel.fromJson(
          element as Map<String, dynamic>,
        ));
      }

      return Right(movies);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          jsonDecode(response.body)['status_message'],
        ),
      );
    }
  }

  @override
  Future<Either<ApiException, List<GenreModel>>> getMoviesGenres({
    String? language,
  }) async {
    final response = await _apiHelper.get(
      'genre/movie/list',
      queryParameters: {
        'language': language ?? 'es',
      },
      headers: {
        'Authorization': 'Bearer ${Env.tmdbAccessKey}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final genresJson = jsonDecode(response.body)['genres'] as List;

      List<GenreModel> genres = [];

      for (final element in genresJson) {
        genres.add(GenreModel.fromJson(
          element as Map<String, dynamic>,
        ));
      }

      return Right(genres);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          jsonDecode(response.body)['status_message'],
        ),
      );
    }
  }

  @override
  Future<Either<ApiException, List<MovieModel>>> searchMovie({
    String? language,
    String? page,
    String? query,
  }) async {
    final response = await _apiHelper.get(
      'search/movie',
      queryParameters: {
        'language': language ?? 'es',
        'page': page ?? '1',
        'include_adult': 'false',
        'include_video': 'false',
        'sort_by': 'popularity.desc',
        'query': query ?? '',
      },
      headers: {
        'Authorization': 'Bearer ${Env.tmdbAccessKey}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final moviesJson = jsonDecode(response.body)['results'] as List;

      List<MovieModel> movies = [];

      for (final element in moviesJson) {
        movies.add(MovieModel.fromJson(
          element as Map<String, dynamic>,
        ));
      }

      return Right(movies);
    } else {
      return Left(
        ApiException(
          response.statusCode,
          jsonDecode(response.body)['status_message'],
        ),
      );
    }
  }
}
