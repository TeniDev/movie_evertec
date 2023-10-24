import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'dart:ui' as ui;

import '../../../core/utils/utils.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../../../gen/l10n.dart';

class MoviesCard extends StatefulWidget {
  const MoviesCard({
    super.key,
    required this.movies,
    this.currentMovieIndex = 0.0,
    required this.updateMovieIndex,
    required this.loadMore,
    required this.goToDetail,
  });

  final List<MovieModel> movies;
  final double currentMovieIndex;
  final Function updateMovieIndex;
  final Function loadMore;
  final Function goToDetail;

  @override
  State<MoviesCard> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> with SingleTickerProviderStateMixin {
  late final PageController _movieCardPageController;

  double _movieCardPage = 0.0;
  int _movieCardIndex = 0;

  @override
  void initState() {
    _movieCardPageController = PageController(
      viewportFraction: .8,
      initialPage: widget.currentMovieIndex.round(),
    )..addListener(_movieCardPagePercentListener);

    setState(() {
      _movieCardPage = widget.currentMovieIndex;
      _movieCardIndex = widget.currentMovieIndex.round();
    });
    super.initState();
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    super.dispose();
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
      widget.updateMovieIndex(_movieCardPageController.page!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * .87,
                child: PageView.builder(
                  controller: _movieCardPageController,
                  clipBehavior: Clip.none,
                  itemCount: widget.movies.length,
                  onPageChanged: (value) {
                    if (value == widget.movies.length - 3) widget.loadMore();
                  },
                  itemBuilder: (context, index) {
                    final movie = widget.movies[index];
                    final progress = (_movieCardPage - index);
                    final scale = ui.lerpDouble(1, .8, progress.abs())!;
                    final isCurrentPage = index == _movieCardIndex;
                    final isScrolling = _movieCardPageController.position.isScrollingNotifier.value;
                    final isFirstPage = index == 0;

                    return Column(
                      children: [
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 400,
                          width: 300,
                          child: Transform.scale(
                            alignment: Alignment.lerp(
                              Alignment.topLeft,
                              Alignment.center,
                              -progress,
                            ),
                            scale: isScrolling && isFirstPage ? 1 - progress : scale,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              transform: Matrix4.identity()
                                ..translate(
                                  isCurrentPage ? 0.0 : -40.0,
                                  isCurrentPage ? 0.0 : -10.0,
                                ),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                    color: Colors.black.withOpacity(.1),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage('${Env.imageUrl}${movie.posterPath}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        isCurrentPage
                            ? Column(
                                children: [
                                  FadeInRight(
                                    duration: const Duration(milliseconds: 500),
                                    from: 30,
                                    child: Text(
                                      movie.title ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Consumer(
                                    builder: (_, ref, __) {
                                      final genreList = ref.watch(genreProvider);
                                      final movieGenres = movie.genreIds
                                          ?.map((e) => genreList?.firstWhere((element) => element.id == e).name)
                                          .toList();

                                      return Text(
                                        '$movieGenres'.replaceAll('[', '').replaceAll(']', ''),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  FadeInDown(
                                    duration: const Duration(milliseconds: 300),
                                    from: 40,
                                    child: Divider(
                                      indent: 30,
                                      endIndent: 30,
                                      color: Theme.of(context).colorScheme.secondary.withOpacity(.4),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  FadeInDown(
                                    duration: const Duration(milliseconds: 300),
                                    from: 30,
                                    child: RichText(
                                      text: TextSpan(
                                        text: S.of(context).releaseDate,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: movie.releaseDate,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                              color: Theme.of(context).colorScheme.secondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
              widget.movies[_movieCardIndex].overview != null && widget.movies[_movieCardIndex].overview!.isNotEmpty
                  ? TextButton(
                      onPressed: () {
                        widget.goToDetail();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary.withOpacity(.3),
                        ),
                      ),
                      child: Text(
                        S.of(context).seeDetail,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          PhosphorIcons.regular.placeholder,
                          size: 14,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          S.of(context).noDetail,
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
