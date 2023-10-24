import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/router.dart';
import '../state/home_state.dart';

final homeEventProvider = StateNotifierProvider<HomeEventNotifier, HomeState>(
  (ref) {
    return HomeEventNotifier(ref);
  },
);

class HomeEventNotifier extends StateNotifier<HomeState> {
  HomeEventNotifier(this.ref)
      : super(const HomeState(
          currentIndexBottomBar: 0,
        ));

  final Ref ref;

  void changeCurrentIndexBottomBar(int index) {
    if (index != state.currentIndexBottomBar) {
      state = state.copyWith(
        currentIndexBottomBar: index,
      );

      ref.read(appRouterProvider).go(
            index == 0 ? RoutesNames.movies : RoutesNames.settings,
          );
    }
  }
}
