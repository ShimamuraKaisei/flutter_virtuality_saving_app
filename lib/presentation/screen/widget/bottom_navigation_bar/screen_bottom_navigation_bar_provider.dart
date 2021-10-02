import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationStateNotifier, int>(
        (_) => BottomNavigationStateNotifier());

class BottomNavigationStateNotifier extends StateNotifier<int> {
  BottomNavigationStateNotifier() : super(0); //0で初期化
  void getCurrentIndex(int index) {
    state = index;
  }
}
