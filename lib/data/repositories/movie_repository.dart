import 'package:either_dart/either.dart';

import '../../core/utils/utils.dart';

abstract class MovieRepository {
  Future<Either<ApiException, List<dynamic>>> getUpcomingMovies({
    String? language,
    String? page,
  });
}
