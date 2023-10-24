import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/router/router.dart';
import '../../../core/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../../gen/l10n.dart';
import '../providers/details_movie_providers.dart';

class DetailsMovieMobile extends ConsumerWidget {
  const DetailsMovieMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsMovieEventProvider);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: state.selectedMovie!.id!,
                  child: Stack(
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              '${Env.imageUrl}${state.selectedMovie!.posterPath}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 450,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.2),
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.selectedMovie!.title ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Consumer(
                        builder: (_, ref, __) {
                          final genreList = ref.watch(genreProvider);
                          final movieGenres = state.selectedMovie!.genreIds
                              ?.map((e) => genreList?.firstWhere((element) => element.id == e).name)
                              .toList();

                          return Wrap(
                            children: [
                              for (var i = 0; i < movieGenres!.length; i++)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  margin: const EdgeInsets.only(right: 8, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    movieGenres[i]!,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      RichText(
                        text: TextSpan(
                          text: S.of(context).releaseDate,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          children: [
                            TextSpan(
                              text: state.selectedMovie!.releaseDate,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.selectedMovie!.overview ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              IconButton(
                onPressed: () => ref.read(appRouterProvider).pop(),
                padding: const EdgeInsets.all(20),
                icon: Icon(
                  PhosphorIcons.regular.caretLeft,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
