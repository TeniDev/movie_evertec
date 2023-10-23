import 'package:flutter/material.dart';
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
  late final PageController _movieDetailPageController;

  double _movieCardPage = 0.0;
  double _movieDetailsPage = 0.0;
  int _movieCardIndex = 0;

  @override
  void initState() {
    _movieCardPageController = PageController(viewportFraction: 0.77)..addListener(_movieCardPagePercentListener);
    _movieDetailPageController = PageController()..addListener(_movieDetailsPagePercentListener);
    super.initState();
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();
    _movieDetailPageController
      ..removeListener(_movieDetailsPagePercentListener)
      ..dispose();
    super.dispose();
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieDetailsPagePercentListener() {
    setState(() {
      _movieDetailsPage = _movieDetailPageController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: PageView.builder(
                controller: _movieDetailPageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.movies.length,
                itemBuilder: (_, index) {
                  final movie = widget.movies[index];
                  final opacity = (index - _movieDetailsPage).clamp(0.0, 1.0);

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * .1),
                    child: Opacity(
                      opacity: 1 - opacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                            type: MaterialType.transparency,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                (movie.title ?? '').toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .7,
              child: PageView.builder(
                controller: _movieCardPageController,
                clipBehavior: Clip.none,
                itemCount: widget.movies.length,
                onPageChanged: (page) {
                  _movieDetailPageController.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 500),
                    curve: const Interval(0.25, 1, curve: Curves.decelerate),
                  );
                },
                itemBuilder: (context, index) {
                  final movie = widget.movies[index];
                  final progress = (_movieCardPage - index);
                  final scale = ui.lerpDouble(1, .8, progress.abs())!;
                  final isCurrentPage = index == _movieCardIndex;
                  final isScrolling = _movieCardPageController.position.isScrollingNotifier.value;
                  final isFirstPage = index == 0;

                  return Transform.scale(
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
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                print(widget.movies[_movieCardIndex].toJson());
              },
              child: const Text(
                'Ver mas',
              ),
            ),
          ],
        );
      },
    );
  }
}
