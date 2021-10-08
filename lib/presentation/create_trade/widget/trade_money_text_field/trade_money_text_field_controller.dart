import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_sate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeAmountMoneyTextFieldController = StateNotifierProvider<
    TradeAmountMoneyTextFieldController,
    TradeMoneyTextFieldState>((ref) => TradeAmountMoneyTextFieldController());

class TradeAmountMoneyTextFieldController
    extends StateNotifier<TradeMoneyTextFieldState> {
  TradeAmountMoneyTextFieldController()
      : super(TradeMoneyTextFieldState()); //初期化

}
