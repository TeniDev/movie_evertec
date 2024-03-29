import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/router/router.dart';
import '../../../gen/l10n.dart';
import '../../../widgets/widgets.dart';
import '../../search_page/providers/search_providers.dart';
import '../providers/movies_providers.dart';
import '../widgets/movies_widgets.dart';

class MoviesMobile extends ConsumerWidget {
  const MoviesMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(moviesEventProvider);

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        actions: [
          Hero(
            tag: 'search',
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: CustomIconButton(
                icon: PhosphorIcons.magnifyingGlass(),
                onPressed: () {
                  ref.read(searchEventProvider.notifier).resetState();
                  ref.read(appRouterProvider).push(RoutesNames.search);
                },
              ),
            ),
          ),
        ],
      ),
      body: state.movies == null
          ? Builder(
              builder: (context) {
                ref.read(moviesEventProvider.notifier).getUpcomingMovies();

                return const Center(
                  child: LoadingAnimation(),
                );
              },
            )
          : state.movies!.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).noMoviesFound,
                  ),
                )
              : MoviesCard(
                  movies: state.movies!,
                  currentMovieIndex: state.currentMovieIndex,
                  updateMovieIndex: (index) => ref.read(moviesEventProvider.notifier).updateMovieIndex(index),
                  loadMore: () => ref.read(moviesEventProvider.notifier).getUpcomingMovies(newPage: true),
                  goToDetail: () => ref.read(moviesEventProvider.notifier).selectDetailMovie(),
                ),
    );
  }
}
