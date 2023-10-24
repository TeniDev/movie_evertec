import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/utils.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';
import '../resources/resources.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return _MovieRepositoryImpl(
    movieResource: ref.watch(movieResourceProvider),
  );
});

class _MovieRepositoryImpl implements MovieRepository {
  _MovieRepositoryImpl({
    required MovieResource movieResource,
  }) : _movieResource = movieResource;

  final MovieResource _movieResource;

  @override
  Future<Either<ApiException, List<MovieModel>>> getUpcomingMovies({
    String? language,
    String? page,
  }) async {
    return _movieResource.getUpcomingMovies(
      language: language,
      page: page,
    );
  }

  @override
  Future<Either<ApiException, List<GenreModel>>> getMoviesGenres({
    String? language,
  }) async {
    return _movieResource.getMoviesGenres(
      language: language,
    );
  }
}
