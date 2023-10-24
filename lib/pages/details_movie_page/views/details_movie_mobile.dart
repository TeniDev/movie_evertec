import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/details_movie_providers.dart';

class DetailsMovieMobile extends ConsumerWidget {
  const DetailsMovieMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsMovieEventProvider);

    return Scaffold(
      body: Center(
        child: Text(
          '$state',
        ),
      ),
    );
  }
}
