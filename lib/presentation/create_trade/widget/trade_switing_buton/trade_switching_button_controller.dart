import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeSwitingButtonController = StateNotifierProvider<
    TradeSwitingButtonStateController,
    TradeSwitchingButtonState>((_) => TradeSwitingButtonStateController());

class TradeSwitingButtonStateController
    extends StateNotifier<TradeSwitchingButtonState> {
  TradeSwitingButtonStateController()
      : super(TradeSwitchingButtonState(indexState: 0)); //0で初期化
  void getCurrentIndex(int index) {
    state = TradeSwitchingButtonState(indexState: index);
  }
}
