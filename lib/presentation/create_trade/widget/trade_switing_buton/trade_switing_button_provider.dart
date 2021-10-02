import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeSwitingButtonProvider =
    StateNotifierProvider<TradeSwitingButtonStateNotifier, Object>(
        (_) => TradeSwitingButtonStateNotifier());

class TradeSwitingButtonStateNotifier extends StateNotifier<Object> {
  TradeSwitingButtonStateNotifier() : super(0); //0で初期化
  void getCurrentIndex(Object index) {
    state = index;
  }
}
