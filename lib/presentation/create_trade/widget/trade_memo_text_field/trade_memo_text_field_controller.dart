import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_create_text_field_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeMemoTextFieldController = StateNotifierProvider<
    TradeMemoTextFieldController,
    TradeMemoTextFieldState>((ref) => TradeMemoTextFieldController());

class TradeMemoTextFieldController
    extends StateNotifier<TradeMemoTextFieldState> {
  TradeMemoTextFieldController() : super(TradeMemoTextFieldState()); //初期化

}
//この中に文字数を判定する