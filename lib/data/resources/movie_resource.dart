import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/utils.dart';
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
  Future<Either<ApiException, List<dynamic>>> getUpcomingMovies({
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
      print(response.body);
      return const Right(
        [],
      );
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
