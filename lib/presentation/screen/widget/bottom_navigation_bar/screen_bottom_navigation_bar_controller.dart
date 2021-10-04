import 'package:flutter_virtuality_saving_app/presentation/screen/widget/bottom_navigation_bar/screen_bottom_navigation_bar_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final bottomNavigationController = StateNotifierProvider<
    BottomNavigationController, ScreenBottomNavigationBarState>(
  (ref) => BottomNavigationController(),
);

class BottomNavigationController
    extends StateNotifier<ScreenBottomNavigationBarState> {
  BottomNavigationController()
      : super(ScreenBottomNavigationBarState(indexState: 0)); //0で初期化
  void getCurrentIndex(int index) {
    state = ScreenBottomNavigationBarState(indexState: index);
  }
}
