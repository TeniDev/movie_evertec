import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({
    Key? key,
    this.mainColor = Colors.blue,
  }) : super(key: key);
  final Color mainColor;

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _firstSizeChange;
  Animation<double>? _firstOpacityChange;
  Animation<AlignmentGeometry>? _firstAlignChange;
  Animation<double>? _secondSizeChange;
  Animation<double>? _secondOpacityChange;
  Animation<AlignmentGeometry>? _secondAlignChange;
  Animation<double>? _thirdSizeChange;
  Animation<double>? _thirdOpacityChange;
  Animation<AlignmentGeometry>? _thirdAlignChange;

  static const double size = 20.0;
  static const double factor = 2.8;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _firstSizeChange = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: size, end: size * factor).chain(
            CurveTween(
              curve: Curves.linear,
            ),
          ),
          weight: 45.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: size * factor, end: size * factor).chain(
            CurveTween(
              curve: Curves.linear,
            ),
          ),
          weight: 10.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: size * factor, end: size).chain(
            CurveTween(
              curve: Curves.linear,
            ),
          ),
          weight: 45.0,
        ),
      ],
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.25),
      )),
    );

    _firstOpacityChange = Tween(begin: 0.0, end: 1.0).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.05),
      )),
    );

    _firstAlignChange = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.1, 0.15),
      )),
    );

    _secondSizeChange = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: size, end: size * factor).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 45.0,
        ),
        TweenSequenceItem<double>(
          tween:
              Tween(begin: size * factor, end: size * factor).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 10.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: size * factor, end: size).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 45.0,
        ),
      ],
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.25, 0.5),
      )),
    );

    _secondOpacityChange = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.25, 0.30),
      )),
    );

    _secondAlignChange = Tween<AlignmentGeometry>(
      begin: Alignment.topRight,
      end: Alignment.bottomRight,
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.35, 0.4),
      )),
    );

    _thirdSizeChange = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(
            begin: size,
            end: size * factor,
          ).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 45.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(
            begin: size * factor,
            end: size * factor,
          ).chain(CurveTween(
            curve: Curves.linear,
          )),
          weight: 10.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(
            begin: size * factor,
            end: size,
          ).chain(
            CurveTween(curve: Curves.linear),
          ),
          weight: 45.0,
        ),
      ],
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.5, 0.75),
      )),
    );

    _thirdOpacityChange = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.5, 0.55),
      )),
    );

    _thirdAlignChange = Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,
      end: Alignment.bottomLeft,
    ).animate(
      (CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.60, 0.65),
      )),
    );

    _controller?.repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size * factor,
      height: size * factor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: size,
              width: size,
              color: widget.mainColor,
            ),
          ),
          AnimatedBuilder(
            animation: _controller!,
            builder: (context, child) {
              return AlignTransition(
                alignment: _secondAlignChange!,
                child: Opacity(
                  opacity: _secondOpacityChange?.value ?? 0.0,
                  child: Container(
                    height: _secondSizeChange?.value,
                    width: size,
                    color: widget.mainColor,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller!,
            builder: (context, child) {
              return AlignTransition(
                alignment: _thirdAlignChange!,
                child: Opacity(
                  opacity: _thirdOpacityChange?.value ?? 0.0,
                  child: Container(
                    height: size,
                    width: _thirdSizeChange?.value,
                    color: widget.mainColor,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller!,
            builder: (context, child) {
              return AlignTransition(
                alignment: _firstAlignChange!,
                child: Opacity(
                  opacity: _firstOpacityChange?.value ?? 0.0,
                  child: Container(
                    height: size,
                    width: _firstSizeChange?.value,
                    color: widget.mainColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
