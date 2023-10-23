import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'dart:ui' as ui;

import '../../../data/models/models.dart';

class MoviesCard extends StatefulWidget {
  const MoviesCard({
    super.key,
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  State<MoviesCard> createState() => _MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard> with SingleTickerProviderStateMixin {
  late final PageController _movieCardPageController;

  double _movieCardPage = 0.0;
  int _movieCardIndex = 0;

  @override
  void initState() {
    _movieCardPageController = PageController(viewportFraction: 0.77)..addListener(_movieCardPagePercentListener);
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
                        isCurrentPage
                            ? FadeInRight(
                                duration: const Duration(milliseconds: 300),
                                from: 30,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(24),
                                    ),
                                  ),
                                  child: Text(
                                    movie.title ?? '',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 16),
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
                            child: GestureDetector(
                              onTap: () {},
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                transform: Matrix4.identity()
                                  ..translate(
                                    isCurrentPage ? 0.0 : -10.0,
                                    isCurrentPage ? 0.0 : 20.0,
                                  ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        isCurrentPage
                            ? FadeInDown(
                                duration: const Duration(milliseconds: 300),
                                from: 30,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Fecha de lanzamiento: ',
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
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
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
                child: const Text(
                  'Ver detalle',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
