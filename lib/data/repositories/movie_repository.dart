import 'package:either_dart/either.dart';

import '../../core/utils/utils.dart';
import '../models/models.dart';

abstract class MovieRepository {
  Future<Either<ApiException, List<MovieModel>>> getUpcomingMovies({
    String? language,
    String? page,
  });

  Future<Either<ApiException, List<GenreModel>>> getMoviesGenres({
    String? language,
  });

  Future<Either<ApiException, List<MovieModel>>> searchMovie({
    String? language,
    String? page,
    String? query,
  });
}
