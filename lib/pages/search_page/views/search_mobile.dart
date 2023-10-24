import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/router/router.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/l10n.dart';
import '../../../widgets/widgets.dart';
import '../providers/search_providers.dart';

class SearchMobile extends ConsumerWidget {
  const SearchMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchEventProvider);
    final debouncer = Debouncer(milliseconds: 500);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: CustomIconButton(
            icon: PhosphorIcons.regular.caretLeft,
            onPressed: () {
              ref.read(appRouterProvider).pop();
            },
          ),
        ),
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            debouncer.run(() {
              ref.read(searchEventProvider.notifier).resetState();

              ref.read(searchEventProvider.notifier).searchMovie(
                    query: value,
                  );
            });
          },
        ),
      ),
      body: state.movies == null
          ? Center(
              child: Hero(
                tag: 'search',
                child: Icon(
                  PhosphorIcons.regular.magnifyingGlass,
                  size: 100,
                  color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
                ),
              ),
            )
          : state.movies!.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).noMoviesFound,
                  ),
                )
              : ListView.builder(
                  itemCount: state.movies!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            ref.read(searchEventProvider.notifier).selectDetailMovie(
                                  index,
                                );
                          },
                          leading: Container(
                            height: 40,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${Env.imageUrl}${state.movies![index].posterPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            state.movies![index].title ?? '',
                          ),
                          trailing: Icon(
                            PhosphorIcons.regular.caretRight,
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        )
                      ],
                    );
                  },
                ),
    );
  }
}
