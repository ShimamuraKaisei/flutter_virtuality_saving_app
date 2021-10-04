import 'dart:ffi';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeNameTextFieldController = StateNotifierProvider<
    TradeNameTextFieldController,
    TradeNameTextFieldState>((ref) => TradeNameTextFieldController());

class TradeNameTextFieldController
    extends StateNotifier<TradeNameTextFieldState> {
  //StateClassを使うことで複数にアクセスできる
  //＜＞の中は型名
  TradeNameTextFieldController() : super(TradeNameTextFieldState()); //初期化
}
