import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/router/router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(appRouterProvider);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          _currentIndex == 0 ? appRouter.go(RoutesNames.movies) : appRouter.go(RoutesNames.settings);
        },
        elevation: 0.0,
        iconSize: 32,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.regular.filmSlate,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.regular.gearSix,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
