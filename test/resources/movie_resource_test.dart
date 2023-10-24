import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:movie_evertec/core/utils/utils.dart';
import 'package:movie_evertec/data/models/models.dart';
import 'package:movie_evertec/data/resources/resources.dart';

import '../data/data_test.dart';

class MockResponse extends Mock implements http.Response {}

class MockMovieResource extends Mock implements MovieTmdbResource {}

void testMovieResource() {
  final apiErrorException = ApiException(404, 'Not found');

  group(
    'MovieTmdbResource',
    () {
      late MovieResource mockMovieTmbdResource;

      setUp(() {
        mockMovieTmbdResource = MockMovieResource();
      });

      group(
        'getUpcomingMovies',
        () {
          test(
            'get movie list',
            () async {
              final response = http.Response(jsonEncode(movieListJson), 200);
              when(
                () => mockMovieTmbdResource.getUpcomingMovies(),
              ).thenAnswer(
                (_) async {
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
                    return Left(apiErrorException);
                  }
                },
              );

              final result = await mockMovieTmbdResource.getUpcomingMovies();

              result.fold(
                (l) => null,
                (r) => expect(r, equals(movieListModel)),
              );
            },
          );

          test(
            'get error',
            () async {
              final response = http.Response('', 404);

              when(
                () => mockMovieTmbdResource.getUpcomingMovies(),
              ).thenAnswer(
                (_) async {
                  if (response.statusCode == 200) {
                    return Right(movieListModel);
                  } else {
                    return Left(apiErrorException);
                  }
                },
              );

              final result = await mockMovieTmbdResource.getUpcomingMovies();

              result.fold(
                (l) => expect(l, equals(apiErrorException)),
                (r) => null,
              );
            },
          );
        },
      );

      group(
        'getMoviesGenre',
        () {
          test(
            'get genre list',
            () async {
              final response = http.Response(jsonEncode(genreListJson), 200);
              when(
                () => mockMovieTmbdResource.getMoviesGenres(),
              ).thenAnswer(
                (_) async {
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
                    return Left(apiErrorException);
                  }
                },
              );

              final result = await mockMovieTmbdResource.getMoviesGenres();

              result.fold(
                (l) => null,
                (r) => expect(r, equals(genreListModel)),
              );
            },
          );

          test(
            'get error',
            () async {
              final response = http.Response('', 404);

              when(
                () => mockMovieTmbdResource.getMoviesGenres(),
              ).thenAnswer(
                (_) async {
                  if (response.statusCode == 200) {
                    return Right(genreListModel);
                  } else {
                    return Left(apiErrorException);
                  }
                },
              );

              final result = await mockMovieTmbdResource.getMoviesGenres();

              result.fold(
                (l) => expect(l, equals(apiErrorException)),
                (r) => null,
              );
            },
          );
        },
      );

      group(
        'searchMovie',
        () {
          test(
            'get search movie list',
            () async {
              final response = http.Response(jsonEncode(movieListJson), 200);
              when(
                () => mockMovieTmbdResource.searchMovie(),
              ).thenAnswer(
                (_) async {
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
                    return Left(apiErrorException);
                  }
                },
              );

              final result = await mockMovieTmbdResource.searchMovie();

              result.fold(
                (l) => null,
                (r) => expect(r, equals(movieListModel)),
              );
            },
          );

          test(
            'get error',
            () async {
              final response = http.Response('', 404);

              when(
                () => mockMovieTmbdResource.searchMovie(),
              ).thenAnswer(
                (_) async {
                  if (response.statusCode == 200) {
                    return Right(movieListModel);
                  } else {
                    return Left(apiErrorException);
                  }
                },
              );

              final result = await mockMovieTmbdResource.searchMovie();

              result.fold(
                (l) => expect(l, equals(apiErrorException)),
                (r) => null,
              );
            },
          );
        },
      );
    },
  );
}
