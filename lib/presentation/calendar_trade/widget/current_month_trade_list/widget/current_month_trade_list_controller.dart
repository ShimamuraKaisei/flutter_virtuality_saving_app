import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/current_month_trade_list/widget/current_month_trade_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeIdController = StateNotifierProvider<TradeIdController, TradeIdState>((_) => TradeIdController());

class TradeIdController extends StateNotifier<TradeIdState> {
  TradeIdController() : super(TradeIdState(tradeId: "")); //初期化
  void getTradeId(String id) {
    state = TradeIdState(tradeId: id);
  }
}
