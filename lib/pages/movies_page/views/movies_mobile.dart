import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/router/router.dart';
import '../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class MoviesMobile extends ConsumerWidget {
  const MoviesMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: InkWell(
          onTap: () async {
            final response = await ref.read(movieRepositoryProvider).getUpcomingMovies(
                  language: 'en',
                  page: '1',
                );

            response.fold(
              (l) => print(l.toString()),
              (r) => print(r),
            );
          },
          child: const Text('Movies Page'),
        ),
      ),
    );
  }
}
