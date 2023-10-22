import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/utils.dart';
import '../base/base.dart';
import '../resources/resources.dart';

final movieProvider = Provider<MovieRepository>((ref) {
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
  Future<Either<ApiException, List<dynamic>>> getUpcomingMovies() async {
    return _movieResource.getUpcomingMovies();
  }
}
