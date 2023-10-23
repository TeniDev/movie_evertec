import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/router/router.dart';
import '../../../widgets/widgets.dart';
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
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: CustomIconButton(
            icon: PhosphorIcons.regular.funnelSimple,
            onPressed: () {
              showModalBottomSheet(
                context: rootNavigatorKey.currentContext!,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Filtros',
                            ),
                            CustomIconButton(
                              icon: PhosphorIcons.regular.x,
                              onPressed: () => ref.read(appRouterProvider).pop(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: CustomIconButton(
              icon: PhosphorIcons.regular.magnifyingGlass,
              onPressed: () => ref.read(appRouterProvider).push(RoutesNames.search),
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
              ? const Center(
                  child: Text(
                    'No hay peliculas',
                  ),
                )
              : MoviesCard(
                  movies: state.movies!,
                ),
    );
  }
}
