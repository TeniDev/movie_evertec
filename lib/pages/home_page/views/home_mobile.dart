import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../providers/home_providers.dart';

class HomeMobile extends ConsumerWidget {
  const HomeMobile({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeEventProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          ref.read(homeEventProvider.notifier).changeCurrentIndexBottomBar(value);
        },
        elevation: 0.0,
        iconSize: 32,
        currentIndex: state.currentIndexBottomBar,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.filmSlate(),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PhosphorIcons.gearSix(),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
